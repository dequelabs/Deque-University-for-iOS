//
//  AccessibleSwitchView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/13/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class AccessibleSwitchView: AccessibleView {
    
    static let NAME_LABEL_TAG = 3
    static let SWITCH_TAG = 4
    
    //Properties to fetch various views within the parent container
    var nameLabel: UILabel {
        return viewWithTag(AccessibleSwitchView.NAME_LABEL_TAG) as! UILabel
    }
    
    var bgSwitch: UISwitch {
        return viewWithTag(AccessibleSwitchView.SWITCH_TAG) as! UISwitch
    }
    
    //UIAccessibility Protocol Property Implementations
    override public var accessibilityLabel: String? {
        get { return nameLabel.text! }
        set{}
    }
    
    override public var accessibilityValue: String? {
        get { return "\(boolToString(bgSwitch.isOn))" }
        set { }
    }
    
    override public var accessibilityTraits: UIAccessibilityTraits {
        get { return UIAccessibilityTraitNone }
        set {}
    }
    
    override public var accessibilityHint: String? {
        get { return "Double tap to toggle setting." }
        set {}
    }
    
    override internal func setup() {
        super.setup()
        
        accessibilityLabel = nameLabel.text!
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(toggleSwitch)))
    }
    
    // Gesture recognizer should toggle Switch
    @objc private func toggleSwitch() {
        bgSwitch.setOn(!bgSwitch.isOn, animated: true)
        bgSwitch.sendActions(for: .valueChanged)
    }
    
    // Convert bool to a readable string
    private func boolToString(_ isOn: Bool) -> String {
        if isOn { return "ON" }
        else { return "OFF" }
    }
}
