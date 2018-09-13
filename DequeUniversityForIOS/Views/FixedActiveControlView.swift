//
//  FixedActiveControlView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/21/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class FixedActiveControlView: FocusOrderedView {
    override func setup() {
        super.setup()
        
        // firstElement is the UILabel, secondElement is the UIButton
        secondElement.accessibilityLabel = (firstElement as! UILabel).text
    }
}
