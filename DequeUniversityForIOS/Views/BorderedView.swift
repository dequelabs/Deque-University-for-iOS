//
//  BorderedView.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/31/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

@IBDesignable internal class BorderedView: UIView {
    
    public var borderColor: UIColor {
        get { return UIColor.DequeGray }
        set { }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    private func setUp() {
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor.cgColor
    }
}

class BrokenView: BorderedView {
    
    override public var borderColor: UIColor {
        get { return UIColor.DequeRed }
        set { }
    }
}

class FixedView: BorderedView {
    
    override public var borderColor: UIColor {
        get { return UIColor.DequeGreen }
        set { }
    }
}
