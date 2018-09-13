//
//  DequeButton.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 3/9/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class DequeButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    private func setUp() {
        let underlineAttributedString = NSAttributedString(string: self.titleLabel!.text!,
                                                           attributes: [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        self.setAttributedTitle(underlineAttributedString, for: .highlighted)
        self.setTitleColor(UIColor.DequeBlue, for: .normal)
        self.titleLabel!.adjustsFontForContentSizeCategory = true
    }
}
