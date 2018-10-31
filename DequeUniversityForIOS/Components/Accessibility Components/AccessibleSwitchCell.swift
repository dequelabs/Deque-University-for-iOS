//
//  AccessibleTableViewCell.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 8/17/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class AccessibleSwitchCell: UITableViewCell {
    
    @IBOutlet weak var switchName: UILabel!
    @IBOutlet weak var a11ySwitch: UISwitch!
    
    override var isAccessibilityElement: Bool {
        get { return true }
        set {}
    }
    
    override var accessibilityElements: [Any]? {
        get { return nil }
        set {}
    }
    
    override var accessibilityLabel: String? {
        get { return switchName.text }
        set { }
    }
    
    override var accessibilityValue: String? {
        get { return a11ySwitch.isOn ? "1" : "0" }
        set {}
    }
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get { return a11ySwitch.accessibilityTraits }
        set {}
    }
}
