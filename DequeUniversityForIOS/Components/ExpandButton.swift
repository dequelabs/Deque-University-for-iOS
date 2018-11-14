//
//  ExpandButton.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 10/30/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ExpandButton: UIButton {
    
    static let TAG = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        self.tag = ExpandButton.TAG
        self.imageView?.tintColor = UIColor.DequeNavy
    }
    
    public func setToExpanded() {
        self.accessibilityLabel = "Collapse for Less Information"
        self.setImage(UIImage(named: "Expanded.png"), for: .normal)
    }
    
    public func setToCollapsed() {
        self.accessibilityLabel = "Expand for More Information"
        self.setImage(UIImage(named: "Collapsed.png"), for: .normal)
    }
}
