//
//  RuleViewController.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/18/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class RuleViewController : UIViewController {
    
    @IBOutlet weak var ruleDescription: UILabel!
    @IBOutlet weak var ruleHelp: UILabel!
    @IBOutlet weak var tags: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboardName = self.storyboard!.value(forKey: "name")! as! String
        let ruleId = Demos.applicableRule(storyboardName)
                
        ruleDescription.text = ruleId.ruleDescription()
        ruleHelp.text = ruleId.ruleHelpText()
        tags.text = "Applicable Tags: \(ruleId.ruleTags())"
        
        self.title = ""

    }
}
