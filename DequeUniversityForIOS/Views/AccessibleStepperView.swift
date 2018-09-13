//
//  A11yStepper.swift
//  TestApp
//
//  Created by Chris McMeeking on 10/21/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import Foundation
import UIKit

class AccessibleStepperView : AccessibleView {

    static let HINT_LABEL_TAG = 5
    static let NAME_LABEL_TAG = 3
    static let STEPPER_TAG = 4

    //Properties to fetch various views within the parent container
    var hintLabel: UILabel {
        return viewWithTag(AccessibleStepperView.HINT_LABEL_TAG) as! UILabel
    }

    var nameLabel: UILabel {
        return viewWithTag(AccessibleStepperView.NAME_LABEL_TAG) as! UILabel
    }
    
    var stepper: UIStepper {
        return viewWithTag(AccessibleStepperView.STEPPER_TAG) as! UIStepper
    }

    //UIAccessibility Protocol Property Implementations
    override public var accessibilityLabel: String? {
        get { return "\(nameLabel.text!)" }
        set{}
    }
    
    override public var accessibilityValue: String? {
        get { return hintLabel.text! }
        set {}
    }

    override public var accessibilityTraits: UIAccessibilityTraits {
        get {
            return UIAccessibilityTraitAdjustable
        }
        set {}
    }

    //UIAccessibility Action Protocol
    override public func accessibilityIncrement() {
        stepper.value += stepper.stepValue
        stepper.sendActions(for: UIControlEvents.valueChanged)
    }

    override public func accessibilityDecrement() {
        stepper.value -= stepper.stepValue
        stepper.sendActions(for: UIControlEvents.valueChanged)
    }
}
