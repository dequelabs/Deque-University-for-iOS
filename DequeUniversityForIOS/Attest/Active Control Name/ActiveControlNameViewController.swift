//
//  ActiveControlsViewController.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 7/11/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ActiveControlNameViewController: RuleViewController {
    
    let linkURL = "https://www.deque.com/tools/worldspace-attest-ios/"
    
    @IBAction func openLink() {
        let url = URL.init(string: linkURL)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @IBAction func changeBackgroundColor(_ sender: UISwitch) {
        
        let parentView = sender.getAncestorOfClass(BorderedView.self)!
        
        if !sender.isOn {
            parentView.backgroundColor = UIColor.clear
        } else {
            parentView.backgroundColor = parentView.borderColor
        }
    }
}
