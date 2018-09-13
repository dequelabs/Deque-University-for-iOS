//
//  ActiveControlsViewController.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 7/11/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ActiveControlNameViewController: RuleViewController {
    
    @IBOutlet weak var brokenView: BrokenView!
    @IBOutlet weak var fixedView: FixedView!
    
    let SWITCH_TAG = 4
    
    @IBAction func toggleBackgroundColor(_ sender: UISwitch) {
        
        var backgroundView: BorderedView!
        
        if sender.tag == SWITCH_TAG {
            backgroundView = fixedView
        } else {
            backgroundView = brokenView
        }
        
        if sender.isOn {
            backgroundView.backgroundColor = backgroundView.borderColor
        } else {
            backgroundView.backgroundColor = UIColor.white
        }
    }

}
