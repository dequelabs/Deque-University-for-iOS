//
//  IssueView.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 10/31/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

internal class IssueView: BorderedView {
    
    static let TAG = 1
    
    override var borderWidth: CGFloat {
        get { return 4.0 }
        set { }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tag = IssueView.TAG
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tag = IssueView.TAG
    }
}

internal class CriticalView: IssueView {
    
    override var borderColor: UIColor {
        get { return UIColor.DequeRed }
        set {}
    }
}

internal class MinorView: IssueView {
    
    override var borderColor: UIColor {
        get { return UIColor.purple }
        set {}
    }
}

internal class PassingView: IssueView {

    override var borderColor: UIColor {
        get { return UIColor.DequeGreen }
        set {}
    }
}

internal class IncompleteView: IssueView {
        
    override var borderColor: UIColor {
        get { return UIColor.yellow }
        set {}
    }
}
