//
//  TypeAdjustingView.swift
//  AttestiOSApp
//
//  Created by Chris McMeeking on 10/26/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import Foundation
import UIKit

public class TypeAdjustingView : UILabel {

    static let HINT_LABEL_TAG = 2;
    static let NAME_LABEL_TAG = 1;
    static let STEPPER_TAG = 3;

    override init(frame: CGRect) {
        super.init(frame: frame)

        NotificationCenter.default.addObserver(self, selector: #selector(adjustType), name: Notification.Name.UIContentSizeCategoryDidChange, object: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustType), name: Notification.Name.UIContentSizeCategoryDidChange, object: nil)
    }

    @objc private func adjustType() {
        self.font = self.font.withSize(UIFont.systemFontSize)
    }
}
