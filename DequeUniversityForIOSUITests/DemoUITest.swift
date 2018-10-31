//
//  DemoUITest.swift
//  AttestiOSAppUITests
//
//  Created by Jennifer Dailey on 1/29/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import XCTest
import Attest

class DemoUITest: XCTestCase {
    
    let DemoToViolationCount = [
        "ActiveControlName" : (RuleID.ActiveControlName, 2),
        "CollidingControls" : (RuleID.CollidingControls, 1),
        "CollidingViews"    : (RuleID.CollidingViews, 2),
        "ColorContrast"     : (RuleID.ColorContrast, 4),
        "ConflictingTraits" : (RuleID.ConflictingTraits, 1),
        "DynamicType"       : (RuleID.DynamicType, 2),
        "FocusableText"     : (RuleID.FocusableText, 1),
        "ImageViewName"     : (RuleID.ImageViewName, 1),
        "InHighlight"       : (RuleID.InHighlight, 1),
        "NestedA11yElements": (RuleID.NestedA11yElements, 1),
        "TouchTargetSize"   : (RuleID.TouchTargetSize, 1)
    ]
        
    override func setUp() {
        super.setUp()

        XCUIApplication().launch()
    }
    
    // Highlights a violation for one second
    func highlightViolation(_ violationName: String) {
                
        if let url = NSURL(string: "http://localhost:\(HTTP_PORT_NUMBER)/api/highlight/\(violationName)") {
            let group = DispatchGroup()
            group.enter()
            
            let task = URLSession.shared.dataTask(with: URLRequest(url: url as URL), completionHandler: {data, response, error in
                
                // Environment variable HIGHLIGHT_TIME is set to 1 (second) in project settings
                if let sleepTime = UInt32(ProcessInfo.processInfo.environment["HIGHLIGHT_TIME"]!) {
                    sleep(sleepTime)
                }
                group.leave()
            })
            task.resume()
            group.wait()

            let urlRequest = URLRequest(url: NSURL(string: "http://localhost:\(HTTP_PORT_NUMBER)/api/remove_highlight")! as URL)
            URLSession.shared.dataTask(with: urlRequest).resume()
        }
    }
    
    func testUIAllDemos() {
        
        //Show all details
        RuleResult.withDetails = true
        
        //Show all passing nodes
        RuleResult.withPasses = true
        
        //Application
        let app = XCUIApplication()
        
        // Loop through each demo listed in NumberOfExpectedViolations Dictionary
        for (a11yIdentifier, pair) in DemoToViolationCount {
            
            // Open a demo
            app.collectionViews.cells.matching(identifier: a11yIdentifier).firstMatch.tap()
            
            sleep(1) // Have to wait one second to avoid race conditions in some simulators
            
            //For each demo, assert that it has one violation per rule listed in the NumberOfExpectedViolation Dictionary
            //Port number is defined in SimpleUITest and in AppDelegate.
            Attest.that(portNumber: HTTP_PORT_NUMBER).isAccessible({ result in
                
                for ruleResult in result.ruleResults {
                    
                    // Highlight each violation for one second before asserting the number of violations
                    for violation in ruleResult.violations {
                        highlightViolation(violation.target)
                    }
                    
                    if pair.0 == ruleResult.rule.ruleId {
                        XCTAssertEqual(pair.1, ruleResult.violations.count, ruleResult.description)
                    } else {
                        XCTAssertEqual(0, ruleResult.violations.count, ruleResult.description)
                    }
                }
            })
            
            // Go back to menu if using an iPhone (not an iPad)
            if UIDevice.current.userInterfaceIdiom == .phone {
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
        }
    }
}
