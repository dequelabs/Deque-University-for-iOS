//
//  RuleViewController.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/18/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit
import Attest

class RuleViewController : UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var demos: UIStackView!
    
    let ruleDescription = RuleDescription()
    let ruleHelp = RuleHelp()
    
    private var ruleId: RuleID {
        get {
            let storyboardName = self.storyboard!.value(forKey: "name")! as! String
            return Demos.applicableRule(storyboardName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(ruleHelp)
        scrollView.backgroundColor = UIColor.DequeNavy
        
        self.title = ruleId.toString()
        
        setupRuleDescription()
        setupStackView()
        setupRuleHelp()
    }
    
    private func setupRuleDescription() {
        ruleDescription.setRuleDescription(ruleId.ruleDescription())
        demos.insertArrangedSubview(ruleDescription, at: 0)
    }
    
    private func setupStackView() {
        
        demos.translatesAutoresizingMaskIntoConstraints = false
        demos.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        demos.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        demos.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        demos.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        demos.bottomAnchor.constraint(equalTo: ruleHelp.topAnchor, constant: -20.0).isActive = true
    }
    
    private func setupRuleHelp() {
        ruleHelp.setRuleHelp(ruleId.ruleHelpText())

        ruleHelp.translatesAutoresizingMaskIntoConstraints = false
        ruleHelp.leadingAnchor.constraint(equalTo: demos.leadingAnchor).isActive = true
        ruleHelp.trailingAnchor.constraint(equalTo: demos.trailingAnchor).isActive = true
        ruleHelp.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
    }
}
