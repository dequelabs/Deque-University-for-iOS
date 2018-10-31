//
//  RuleDescription.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 10/30/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class RuleDescription: DQView {
    
    let ruleDescription = A11yLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.addSubview(ruleDescription)
        self.backgroundColor = UIColor.DequeWhite
        
        setupRuleDescription()
    }
    
    private func setupRuleDescription() {
        
        ruleDescription.textColor = UIColor.DequeDarkGray
        
        // Constraints
        ruleDescription.translatesAutoresizingMaskIntoConstraints = false
        ruleDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        ruleDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        ruleDescription.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        ruleDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
    
    public func setRuleDescription(_ text: String) {
        ruleDescription.text = text
    }
}
