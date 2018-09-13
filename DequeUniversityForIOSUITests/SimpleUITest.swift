//
//  AttestiOSAppUITests.swift
//  AttestiOSAppUITests
//
//  Created by Chris McMeeking on 10/23/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import XCTest
import Attest

let HTTP_PORT_NUMBER = 48485 // This is also defined in AppDelegate. If port number needs to be changed, update both here and in AppDelegate.

class SimpleUITest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    func testUISimple() {
        Attest.that(portNumber: HTTP_PORT_NUMBER).isAccessible()
    }
}
