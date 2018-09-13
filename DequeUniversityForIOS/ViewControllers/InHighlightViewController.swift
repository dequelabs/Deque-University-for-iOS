//
//  ElementInFocusBox.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/6/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class InHighlightViewController: RuleViewController, UIScrollViewDelegate {

    @IBOutlet weak var brokenButton: UIButton!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setA11yPaths()
    }

    override func viewDidLayoutSubviews() {
        setA11yPaths()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setA11yPaths()
    }
    private func setA11yPaths() {
        let frame = brokenButton.getA11yFrame()
        brokenButton.accessibilityPath = UIBezierPath(rect: CGRect.init(x: frame.origin.x,
                                                                        y: frame.origin.y,
                                                                        width: frame.width / 2,
                                                                        height: frame.height / 2))
    }
}
