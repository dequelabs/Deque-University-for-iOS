//
//  BorderedView.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/31/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

@IBDesignable internal class BorderedView: RoundedView {
    
    internal var borderColor: UIColor = UIColor.DequeGray
    internal var borderWidth: CGFloat = 2.0
    
    override var cornerRadius: CGFloat {
        return 20
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
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
