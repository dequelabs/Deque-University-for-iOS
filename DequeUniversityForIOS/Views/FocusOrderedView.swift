//
//  FocusOrderedView.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/21/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class FocusOrderedView: UIView {
    
    let FIRST_ELEMENT_TAG = 100
    let SECOND_ELEMENT_TAG = 99
    
    @IBAction func openLink() {
        let url = URL.init(string: "https://www.deque.com/tools/worldspace-attest/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    var firstElement: UIView {
        return self.viewWithTag(FIRST_ELEMENT_TAG)!
    }
    
    var secondElement: UIView {
        return self.viewWithTag(SECOND_ELEMENT_TAG)!
    }
    
    internal func setup() {
        self.accessibilityElements = [firstElement, secondElement]
    }
}
