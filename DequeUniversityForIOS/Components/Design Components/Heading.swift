//
//  Heading.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/1/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class Heading: A11yLabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.textColor = UIColor.DequeNavy
        self.font = UIFont.preferredFont(forTextStyle: .headline)
        self.accessibilityTraits = UIAccessibilityTraits(rawValue: UIAccessibilityTraits.staticText.rawValue | UIAccessibilityTraits.header.rawValue)
    }
}

/// Used to determine height of text in a view
internal class MockedHeading {
    
    private let heading: Heading
    
    init(text: String, width: CGFloat) {
        let frame = CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude)
        heading = Heading(frame: frame)
        
        heading.text = text
        heading.sizeToFit()
    }
    
    internal var height: CGFloat {
        return heading.frame.height
    }
    
    internal var width: CGFloat {
        return heading.frame.width
    }
}
