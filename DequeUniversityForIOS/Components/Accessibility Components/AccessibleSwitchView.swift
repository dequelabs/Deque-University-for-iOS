//
//  AccessibleSwitchView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/13/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class AccessibleSwitchView: AccessibleView {
    
    @IBOutlet weak var switchName: UILabel!
    @IBOutlet weak var a11ySwitch: UISwitch!
    
    //UIAccessibility Protocol Property Implementations
    override public var accessibilityLabel: String? {
        get { return switchName.text! }
        set{}
    }
    
    override public var accessibilityValue: String? {
        get { return a11ySwitch.isOn ? "1" : "0" }
        set { }
    }
    
    override public var accessibilityTraits: UIAccessibilityTraits {
        get { return a11ySwitch.accessibilityTraits }
        set {}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(toggleSwitch)))
    }
    
    // Gesture recognizer should toggle Switch
    @objc private func toggleSwitch() {
        a11ySwitch.setOn(!a11ySwitch.isOn, animated: true)
        a11ySwitch.sendActions(for: .valueChanged)
    }
}
