//
//  AccessibleTableViewCell.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 8/17/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class AccessibleSwitchCell: UITableViewCell {
    
    let SWITCH_TAG = 4
    let LABEL_TAG = 3
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessibilityLabel = label.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.accessibilityLabel = label.text
    }
    
    private var sw: UISwitch {
        return viewWithTag(SWITCH_TAG) as! UISwitch
    }
    
    private var label: UILabel {
        return viewWithTag(LABEL_TAG) as! UILabel
    }
    
    override var isAccessibilityElement: Bool {
        get { return true }
        set {}
    }
    
    override var accessibilityElements: [Any]? {
        get { return nil }
        set {}
    }
    
    override var accessibilityValue: String? {
        get { return boolToString(sw.isOn) }
        set {}
    }
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get { return UIAccessibilityTraitNone }
        set {}
    }
    
    override var accessibilityHint: String? {
        get { return "Double tap to toggle setting." }
        set {}
    }
    
    private func boolToString(_ bool: Bool) -> String {
        if bool { return "On" }
        return "Off"
    }
}
