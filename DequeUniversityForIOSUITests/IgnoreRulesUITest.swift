//
//  IgnoreRulesUITest.swift
//  AttestiOSAppUITests
//
//  Created by Jennifer Dailey on 1/24/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import XCTest
import Attest

class IgnoreRulesUITest: XCTestCase {
    
    // Accessibililty identifier of ColorContrast Demo
    let CONFLICTING_TRAITS = "Conflicting Traits"
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
        
        XCUIApplication().tables.cells.matching(identifier: CONFLICTING_TRAITS).firstMatch.tap() // Open Contrast Alpha Blend Demo
    }
    
    //Set up a list of Rule IDs to ignore.
    static var ignoredRuleIDs: [RuleID] = [
        RuleID.ConflictingTraits,
        RuleID.ImageViewName,
        RuleID.CustomRule
    ];
    
    //Set up a static function that utilizes the list of ignored IDs
    static func resultConsumer(attestResult: Attest.Result) {
        for ruleResult in attestResult.ruleResults {
            if (!ignoredRuleIDs.contains(ruleResult.rule.ruleId)) {
                XCTAssertEqual(Impact.Pass.toString(), ruleResult.impact.toString(), ruleResult.description)
            }
        }
    }
    
    //Testing using the above function as the result consumer.
    func testUISuccessfullyIgnoringRules() {
        sleep(1)
        Attest.that(portNumber: HTTP_PORT_NUMBER).isAccessible(IgnoreRulesUITest.resultConsumer)
    }
}
