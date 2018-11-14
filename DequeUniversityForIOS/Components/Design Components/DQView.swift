//
//  DequeView.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/1/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class DQView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = UIColor.DequeWhite
    }
}
