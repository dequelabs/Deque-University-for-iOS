require 'json'

EXCEPT_STRING = " except"

Then(/^Attest that port ([0-9]*) is accessible(( with ([0-9]*) violations?|#{EXCEPT_STRING})( for rule (Accessibility Hint|Color Contrast|Conflicting Traits|Don't Intersect|Dynamic Type|In Highlight|Nested A11y Elements|Speakable Text|Touch Target Size))?)?( with highlighting)?$/) do |port, arguments, violationsOrExcept, number, forRule, rule, withHighlight|

    parsedJSON = retrieveJSONObj(port)
    violations = parsedJSON["violations"]

    isRuleException = violationsOrExcept == EXCEPT_STRING && forRule != nil                 # True if " except for rule <Rule Name>" was provided
    isViolationException = violationsOrExcept != EXCEPT_STRING && forRule == nil            # True if " with # violations" was provided (or just says "Attest that port # is accessible")
    isViolationExceptionWithRule = violationsOrExcept != EXCEPT_STRING && forRule != nil    # True if " with # violations for rule <Rule Name>" was provided

    numTotalViolations = 0
    unexpectedRuleViolations = false

    ### LAMBDA FUNCTIONS

    # Add violation
    addViolation = lambda {|ruleNode, reportString|
        nodes = ruleNode["nodes"]

        numTotalViolations += nodes.count
        puts createViolationString(ruleNode)
        puts reportString

        if withHighlight != nil
            addFocusToViolatingView(port, nodes)
        end
    }

    ### END LAMBDA FUNCTIONS


    # Invalid statement found
    if !isRuleException && !isViolationException && !isViolationExceptionWithRule
        fail "Incomplete statement. Acceptable phrases:\nAttest that port # is accessible\nAttest that port # is acessible with # violations\nAttest that port # is accessible except for rule <Rule Name>\nAttest that port # is accessible with # violations for rule <Rule Name>"
    end

    # Loop through violations
    violations.each do |ruleWithNodes|

        # Count number of violations except within the rule provided
        if ruleWithNodes["id"] != rule 
            expectedViolations = isViolationException && arguments != nil ? "" : " Expected 0 violations."
            addViolation.call(ruleWithNodes, "Found #{ruleWithNodes["nodes"].count} violations for rule #{ruleWithNodes["id"]}.#{expectedViolations}")

        # Count number of violations within rule provided (if necessary)
        elsif isViolationExceptionWithRule && ruleWithNodes["id"] == rule
            
            # Add violation information if there's more/less violations than expected
            if ruleWithNodes["nodes"].count != number.to_i
                unexpectedRuleViolations = true
                addViolation.call(ruleWithNodes, "Found #{ruleWithNodes["nodes"].count} violations for rule #{ruleWithNodes["id"]}. Expected #{number} violations.")
            end
        end
    end

    # Set number if not previously set
    if number == nil
        number = 0
    end

    # Fail if there are more/less violations found than expected
    if isViolationException && numTotalViolations != number.to_i
        fail "\nFound #{numTotalViolations} total violations. Expected #{number} violations."

    elsif isRuleException && numTotalViolations > 0
        fail "\nFound #{numTotalViolations} total violations. Expected #{number} violations."

    elsif isViolationExceptionWithRule && (numTotalViolations > 0 || unexpectedRuleViolations)
        fail "\nFound #{numTotalViolations} total violations. Expected #{number} violations in rule #{rule} and 0 violations for all other rules."
    end
end

def retrieveJSONObj(portNum)
    open("http://localhost:#{portNum}/api/axe_results") {|f|
        json = f.read
        return JSON.parse(json)
    }
end

# Highlights violating view
def addFocusToViolatingView(portNum, nodes)
    nodes.each do |node|
        target = node["target"][0]
        open("http://localhost:#{portNum}/api/highlight/#{target}")
    end
end

# place all violations in a string
def createViolationString(rulenode)
    string = "\n#{rulenode["id"]}: #{rulenode["help"]}\n"

    rulenode["nodes"].each do |node|      
        node["all"].each do |check|
            string.concat("\t#{check["impact"]}: #{check["message"]}\n")
        end

        node["json"].each do |key,value|
            string.concat("\t#{key}: #{value}\n")
        end

        string.concat("\n")
    end

    return string
end
