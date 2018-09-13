//
//  LabelAssociation.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/30/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class A11yHintViewController: RuleViewController {

    @IBOutlet weak var brokenCounter: UILabel!
    @IBOutlet weak var fixedCounter: UILabel!
    @IBOutlet weak var fixedStepper: UIStepper!
    
    @IBAction func valueChanged(_ sender: UIStepper) {
        
        // Fixed Stepper
        if sender.tag == AccessibleStepperView.STEPPER_TAG {
            changeLabel(fixedCounter, toValue: Int(sender.value))
        }
        
        // Broken Stepper
        else {
            changeLabel(brokenCounter, toValue: Int(sender.value))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add accessibility hints to the stepper for fixed example
        fixedStepper.subviews[0].accessibilityHint = "Decreases number of tomatoes by 1."
        fixedStepper.subviews[1].accessibilityHint = "Increases number of tomatoes by 1."
    }
    
    private func changeLabel(_ label: UILabel, toValue value: Int) {
        label.text = "\(value) Tomatoes"
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification,
                                        label.text)
    }
    
    // More information about the fixed version can be found in AccessibleStepperView.swift
}
