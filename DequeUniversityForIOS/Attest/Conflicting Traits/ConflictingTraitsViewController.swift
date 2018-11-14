//
//  ConflictingTraitsViewController.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/15/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ConflictingTraitsViewController: RuleViewController {
    @IBAction func openLink() {
        let url = URL.init(string: "https://www.deque.com/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}
