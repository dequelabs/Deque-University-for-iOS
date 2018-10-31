//
//  ExpandButton.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/6/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ExpandableView: UIStackView {
    
    private let collapsableView: UIView
    private var isExpanded = true
    
    private var _expandButton: ExpandButton?
    private var expandButton: ExpandButton {
        if _expandButton == nil {
            _expandButton = viewWithTag(ExpandButton.TAG) as? ExpandButton
        }
        
        return _expandButton!
    }
    
    init(_ mainView: UIView,
         collapsableView cv: UIView) {
        
        collapsableView = cv
        super.init(frame: CGRect.zero)
        
        self.addArrangedSubview(mainView)
        self.addArrangedSubview(cv)
        self.axis = .vertical
        
        setup()
    }
    
    override init(frame: CGRect) {
        collapsableView = UIView()
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        collapsableView = UIView()
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        toggleExpansion()
        expandButton.addTarget(self, action: #selector(toggleExpansion), for: .touchUpInside)
    }
    
    @objc internal func toggleExpansion() {
        if isExpanded {
            expandButton.setToCollapsed()
        } else {
            expandButton.setToExpanded()
        }
        
        collapsableView.isHidden = isExpanded
        isExpanded = !isExpanded
    }
}
