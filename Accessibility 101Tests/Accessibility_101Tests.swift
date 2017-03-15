//
//  Accessibility_101Tests.swift
//  Accessibility 101Tests
//
//  Created by Chris McMeeking on 9/19/16.
//  Copyright © 2016 Deque Systems. All rights reserved.
//

import XCTest
import A11yAnalysisFramework

class Accessibility_101Tests: XCTestCase {
    
    let viewController = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "brokenTrait");
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssert(A11yAssert.that(viewController.view).allRules()
            .exceptRule(RuleCorrectTraits)
            .isAccessible(), A11yAssert.failureMessage());
    }
}
