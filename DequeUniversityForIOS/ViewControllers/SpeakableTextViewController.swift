//
//  LabelActiveControls.swift
//  TestApp
//
//  Created by Jennifer Dailey on 10/13/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class SpeakableTextViewController: RuleViewController {
    @IBOutlet weak var brokenButton: UIButton!
    @IBOutlet weak var brokenLabel: UILabel!
    @IBOutlet weak var brokenButtonView: UIView!
    
    @IBAction func openLink(_ sender: Any) {
        let url = URL.init(string: "https://www.deque.com/tools/worldspace-attest/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        brokenButtonView.accessibilityElements = [brokenLabel, brokenButton]
    }
    
    // More information on the fixed version can be found in AccessibleLinkView.swift
}
