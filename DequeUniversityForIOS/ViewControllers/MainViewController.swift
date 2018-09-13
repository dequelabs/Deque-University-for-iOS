//
//  DUSplitViewController.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/29/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UISplitViewController, UISplitViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredDisplayMode = UISplitViewControllerDisplayMode.allVisible
    }
}
