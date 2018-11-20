//
//  RuleHelp.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 10/30/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class RuleHelp: RoundedView {
    
    let heading = Heading()
    let help = A11yLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.addSubview(heading)
        self.addSubview(help)
        
        setupHeading()
        setupRuleHelp()
    }
    
    private func setupHeading() {
        heading.text = "Rule Help"
        
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        heading.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        heading.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        heading.bottomAnchor.constraint(equalTo: help.topAnchor, constant: -10).isActive = true
    }
    
    private func setupRuleHelp() {
        help.font = UIFont.preferredFont(forTextStyle: .subheadline)
        
        help.translatesAutoresizingMaskIntoConstraints = false
        help.leadingAnchor.constraint(equalTo: heading.leadingAnchor).isActive = true
        help.trailingAnchor.constraint(equalTo: heading.trailingAnchor).isActive = true
        help.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
    
    public func setRuleHelp(_ text: String) {
        help.text = text
    }
}
