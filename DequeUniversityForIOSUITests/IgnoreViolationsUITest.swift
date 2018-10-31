//
//  IgnoreViolationsUITest.swift
//  AttestiOSAppUITests
//
//  Created by Jennifer Dailey on 1/24/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import XCTest
import Attest

class IgnoreViolationsUITest: XCTestCase {
    
    // Accessibility Identifier of LabelAssociation Demo
    let CONFLICTING_TRAITS = "ConflictingTraits"
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
        XCUIApplication().collectionViews.cells.matching(identifier: CONFLICTING_TRAITS).firstMatch.tap() // Open Label Association Demo
    }
    
    /* Ignore a violation for a particular rule. */
    func testUIAndIgnoreSingleViolation() {
        
        Attest.that(portNumber: HTTP_PORT_NUMBER).isAccessible({(result:AttestResult) -> () in
            
            print(result.description)
            
            for ruleResult in result.ruleResults {
                switch ruleResult.rule.ruleId {
                case .ConflictingTraits:
                    //We're allowing one accessibility hint violation
                    XCTAssertEqual(1, ruleResult.violations.count, ruleResult.description)
                default:
                    //No other Rules must have violations
                    XCTAssertEqual(0, ruleResult.violations.count, ruleResult.description)
                }
            }
        })
    }
}
