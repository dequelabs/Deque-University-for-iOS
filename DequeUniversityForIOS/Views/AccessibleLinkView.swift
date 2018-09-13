//
//  AccessibleButtonView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/13/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class AccessibleLinkView: AccessibleView {
    
    static let LABEL_TAG = 3
    static let BUTTON_TAG = 4
    
    @IBAction func openLink() {
        let url = URL.init(string: "https://www.deque.com/tools/worldspace-attest/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    //Properties to fetch various views within the parent container
    var label: UILabel {
        get { return viewWithTag(AccessibleLinkView.LABEL_TAG) as! UILabel }
        set {}
    }
    
    var button: UIButton {
        get { return viewWithTag(AccessibleLinkView.BUTTON_TAG) as! UIButton }
        set {}
    }
    
    //UIAccessibility Protocol Property Implementations
    override public var accessibilityLabel: String? {
        get { return label.text }
        set {}
    }
    
    override public var accessibilityTraits: UIAccessibilityTraits {
        get { return UIAccessibilityTraitLink }
        set {}
    }
    
    override public var accessibilityActivationPoint: CGPoint {
        get { return self.convert(button.center, to: UIApplication.shared.windows.first) }
        set {}
    }
}
