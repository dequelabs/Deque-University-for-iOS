import XCTest
import Attest

class DemoTests: XCTestCase {

    /* Some cool hackery. Each of our demos has one accessibility issue in it. Assert that this is so! */
    func testAllDemos() {

        //Show all details.
        RuleResult.withDetails = true

        //For each demo assert that it has one violation on the rule that it demos and is otherwise accessible.
        for demo in Demos.allCases {
            Attest.that(viewController: demo.makeViewController()).isAccessible({ (result) in

                for ruleResult in result.ruleResults {
                    
                    let message = "\(demo.toString()) \(ruleResult.description)"
                    
                    if (ruleResult.rule.ruleId == demo.applicableRule()) {
                        XCTAssertEqual(demo.numberOfViolations(), ruleResult.violations.count, message)
                    } else {
                        XCTAssertEqual(0, ruleResult.violations.count, message)
                    }
                }
            });
        }
    }
}

