//
//  AccessibleButtonView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/13/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class AccessibleLinkView: AccessibleView {
        
    @IBOutlet weak var linkName: UILabel!
    @IBOutlet weak var link: UIButton!
    
    //UIAccessibility Protocol Property Implementations
    override public var accessibilityLabel: String? {
        get { return linkName.text }
        set {}
    }
    
    override public var accessibilityTraits: UIAccessibilityTraits {
        get { return UIAccessibilityTraits.link }
        set {}
    }
    
    override public var accessibilityActivationPoint: CGPoint {
        get { return self.convert(link.center, to: UIApplication.shared.windows.first) }
        set {}
    }
}
