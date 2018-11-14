//
//  FixedLinkView.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/6/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class FixedLinkView: FocusOrderedView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let label = firstElement as? UILabel else { return }
        
        secondElement.accessibilityLabel = label.text
    }
}
