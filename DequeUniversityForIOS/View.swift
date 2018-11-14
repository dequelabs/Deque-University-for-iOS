//
//  View.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/7/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Crawls up the view hierarchy (starting with `self`) until it finds a view of class type `clazz`, then returns this view.
     - Parameter clazz: The class type that the parent view should be.
     - Returns: The parent view with class type `clazz`.
    **/
    public func getAncestorOfClass<T>(_ clazz: T.Type) -> T? {
        var parent: UIView? = self
        
        while let p = parent {
            if let typedView = p as? T {
                return typedView
            }
            
            parent = p.superview
        }
        
        return nil
    }
}
