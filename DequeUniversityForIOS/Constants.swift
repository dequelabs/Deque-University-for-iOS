//
//  DUConstants.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/29/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit
import Attest

public enum Demos: Int {

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
    
    public static func count() -> Int {
        return names().count
    }
    
    public static func values() -> [Demos] {
        var results: [Demos] = []
        
        for index in 0 ... Int.max {
            if let pattern = Demos(rawValue: index) {
                results.append(pattern)
            } else {
                break
            }
        }
        
        return results
    }
    
    public static func names() -> [String] {
        var results: [String] = []
        
        for index in 0 ... Int.max {
            if let pattern = Demos.init(rawValue: index) {
                results.append("\(pattern)")
            } else {
                break
            }
        }
        
        return results
    }
    
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
        return Demos.applicableRule(self.storyBoardName())
    }
    
    internal func numberOfViolations() -> Int {
        switch self {
            case .ActiveControlName: return 3
            case .CollidingViews: return 2
            case .ColorContrast: return 4
            case .DynamicType: return 2
            
            default: return 1
        }
    }

    public func makeViewController() -> UIViewController {
        return UIStoryboard(name: self.storyBoardName(), bundle: nil).instantiateInitialViewController()!
    }
    
    public func storyBoardName() -> String {
        return String("\(self)")
    }
}
