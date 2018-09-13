import XCTest
import Attest

class IgnoreViolations: XCTestCase {

    /* Ignore a violation for a particular rule. */
    func testAndIgnoreSingleViolation() {
        
        Attest.that(storyBoardName: "ConflictingTraits").isAccessible({(result:AttestResult) -> () in
            
            RuleResult.withPasses = true
            RuleResult.withDetails = true

            for ruleResult in result.ruleResults {
                switch (ruleResult.rule.ruleId) {
                    
                case .ConflictingTraits:
                    //We're allowing one accessibility hint violation
                    XCTAssertEqual(1, ruleResult.violations.count, ruleResult.description)
                    
                case .ImageViewName:
                    XCTAssertEqual(Impact.Inapplicable.toString(), ruleResult.impact.toString(), ruleResult.description)
                    
                case .CustomRule:
                    // We're allowing this rule to be seen as inapplicable to this view controller
                    XCTAssertEqual(Impact.Inapplicable.toString(), ruleResult.impact.toString(), ruleResult.description)
                default:
                    //Everything else must pass.
                    XCTAssertEqual(Impact.Pass.toString(), ruleResult.impact.toString(), ruleResult.description)
                }
            }
        })
    }
}
