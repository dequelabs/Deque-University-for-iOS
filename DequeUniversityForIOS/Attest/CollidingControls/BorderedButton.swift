//
//  BorderedButton.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/12/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class BorderedButton: A11yButton {
    
    internal var borderColor: UIColor = UIColor.DequeNavy
    internal var borderWidth: CGFloat = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }

}
