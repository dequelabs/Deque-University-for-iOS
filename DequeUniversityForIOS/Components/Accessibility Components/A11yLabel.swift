//
//  DequeLabel.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/1/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class A11yLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.DequeBlack
        self.numberOfLines = 0
        self.adjustsFontForContentSizeCategory = true
        self.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
