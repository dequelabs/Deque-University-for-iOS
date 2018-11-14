//
//  ContentView.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 10/30/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ContentView: DQView {
    
    private let demo: UIView
    private let title = Heading()
    private let expandButton = ExpandButton()
    
    override var accessibilityElements: [Any]? {
        get { return [ title, demo, expandButton ] }
        set { }
    }
    
    init(title titleString: String, demo demoView: UIView) {
        demo = demoView
        title.text = titleString
        super.init(frame: CGRect.zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.demo = UIView()
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = UIColor.DequeWhite
        
        self.addSubview(title)
        self.addSubview(demo)
        self.addSubview(expandButton)
        
        setupTitle()
        setupDemo()
        setupButton()
    }

    private func setupTitle() {
        
        // Status Constraints
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0).isActive = true
        title.bottomAnchor.constraint(equalTo: demo.topAnchor, constant: -10.0).isActive = true
    }
    
    private func setupDemo() {
        
        // Demo Constraints
        demo.translatesAutoresizingMaskIntoConstraints = false
        demo.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        demo.trailingAnchor.constraint(equalTo: expandButton.leadingAnchor, constant: -10.0).isActive = true
        demo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20.0).isActive = true
    }
    
    private func setupButton() {
        
        expandButton.tintColor = UIColor.DequeBlue
        
        // Button Constraints
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        expandButton.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
        expandButton.centerYAnchor.constraint(equalTo: demo.centerYAnchor).isActive = true
        expandButton.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        expandButton.heightAnchor.constraint(equalTo: expandButton.widthAnchor, multiplier: 1).isActive = true
    }
}
