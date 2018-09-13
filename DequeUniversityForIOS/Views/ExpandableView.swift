//
//  ExpandButton.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/6/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ExpandableView: UIStackView {
    private let EXPANDED_VIEW_TAG = 1
    private let BUTTON_TAG = 2
    
    private var expandedView: UIView {
        get { return self.viewWithTag(EXPANDED_VIEW_TAG)! }
        set {}
    }
    
    private var button: UIButton {
        get { return self.viewWithTag(BUTTON_TAG) as! UIButton }
        set {}
    }
    
    private var isExpanded = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        button.addTarget(self, action: #selector(toggleExpansion), for: .touchUpInside)
        button.tintColor = UIColor.DequeBlue
        
        toggleExpansion()
    }
    
    @objc private func toggleExpansion() {
        isExpanded = !isExpanded
        expandedView.isHidden = !isExpanded
        
        if isExpanded {
            button.accessibilityLabel = "Collapse for Less Information"
            button.setImage(UIImage(named: "Close.png"), for: .normal)
        } else {
            button.accessibilityLabel = "Expand for More Information"
            button.setImage(UIImage(named: "Open.png"), for: .normal)
        }
    }
}
