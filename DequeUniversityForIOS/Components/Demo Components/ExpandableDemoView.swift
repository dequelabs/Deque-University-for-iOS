//
//  ExpandableDemoView.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/5/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class ExpandableDemoView: ExpandableView {
    
    init(title demoTitle: String,
         demo demoView: UIView,
         description demoDescription: UIView) {
        
        let content = ContentView(title: demoTitle, demo: demoView)
        super.init(content, collapsableView: demoDescription)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
