//
//  DUConstants.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/29/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit
import Attest

public enum Demos: CaseIterable {

    case ActiveControlName
    case CollidingControls
    case CollidingViews
    case ColorContrast
    case ConflictingTraits
    case DynamicType
    case FocusableText
    case ImageViewName
    case InHighlight
    case NestedA11yElements
    case TouchTargetSize
    
    public static func applicableRule(_ storyboardName: String) -> RuleID {
        switch storyboardName {
        case "ActiveControlName":
            return RuleID.ActiveControlName
        case "CollidingControls":
            return RuleID.CollidingControls
        case "CollidingViews":
            return RuleID.CollidingViews
        case "ColorContrast":
            return RuleID.ColorContrast
        case "ConflictingTraits":
            return RuleID.ConflictingTraits
        case "DynamicType":
            return RuleID.DynamicType
        case "FocusableText":
            return RuleID.FocusableText
        case "ImageViewName":
            return RuleID.ImageViewName
        case "InHighlight":
            return RuleID.InHighlight
        case "NestedA11yElements":
            return RuleID.NestedA11yElements
        case "TouchTargetSize":
            return RuleID.TouchTargetSize
        default:
            return RuleID.CustomRule
        }
    }
    
    internal func applicableRule() -> RuleID {
        return Demos.applicableRule(self.toString())
    }
    
    internal func numberOfViolations() -> Int {
        switch self {
            case .ActiveControlName: return 2
            case .CollidingViews: return 2
            case .ColorContrast: return 4
            case .DynamicType: return 2
            
            default: return 1
        }
    }

    public func makeViewController() -> UIViewController {
        return UIStoryboard(name: self.toString(), bundle: nil).instantiateInitialViewController()!
    }
    
    /// Demo enum, as a String (aka RuleID as String)
    public func toString() -> String {
        return "\(self)"
    }
    
    /// Name of the demo
    public func demoTitle() -> String {
        switch self {
        case .ActiveControlName: return "Active Controls"
        case .CollidingControls: return "Colliding Controls"
        case .CollidingViews: return "Colliding Elements"
        case .ColorContrast: return "Color Contrast"
        case .ConflictingTraits: return "Conflicting Traits"
        case .DynamicType: return "Dynamic Type"
        case .FocusableText: return "Focusable Text"
        case .ImageViewName: return "Image Views"
        case .InHighlight: return "Element Bounds"
        case .NestedA11yElements: return "Nested Elements"
        case .TouchTargetSize: return "Target Size"
        }
    }
}
