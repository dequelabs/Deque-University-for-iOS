//
//  AccessibleView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/13/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class AccessibleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //UIAccessibility Protocol Property Implementations
    override public var accessibilityLabel: String? {
        get {
            fatalError("Accessibility Label not set")
        }
        set{}
    }
    
    override final public var isAccessibilityElement: Bool {
        get { return true }
        set {}
    }
    
    override public var accessibilityTraits: UIAccessibilityTraits {
        get {
            fatalError("Accessibility Traits not set")
        }
        set {}
    }
    
    override public var accessibilityElements: [Any]? {
        get { return nil }
        set {}
    }
    
    // Override this function to call anything in the init functions
    internal func setup() {
        for view in self.subviews {
            view.isAccessibilityElement = false
        }
    }
}
