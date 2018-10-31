//
//  FocusOrderedView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/21/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class FocusOrderedView: UIView {
    
    @IBOutlet var firstElement: UIView!
    @IBOutlet var secondElement: UIView!
    
    override var accessibilityElements: [Any]? {
        get { return [ firstElement, secondElement ] }
        set { }
    }
}
