//
//  AppDelegate.swift
//  TestApp
//
//  Created by Chris McMeeking on 4/26/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit
import Attest

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let HTTP_PORT_NUMBER = 48485

    var window: UIWindow?

    func applicationDidBecomeActive(_ application: UIApplication) {
        Attest.startHTTPServer(AppDelegate.HTTP_PORT_NUMBER)
    }
}
