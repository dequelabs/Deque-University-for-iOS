//
//  TouchTargetSize_Example.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/7/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class TouchTargetSizeViewController: ActiveControlNameViewController, UITableViewDataSource, UITableViewDelegate {
    
    let TABLEVIEW_REUSABLE_ID = "TableViewCell"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TABLEVIEW_REUSABLE_ID, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let sw = tableView.viewWithTag(SWITCH_TAG) as? UISwitch {
            sw.setOn(!sw.isOn, animated: true)
            sw.sendActions(for: .valueChanged)
        }
    }
    
    /* More accessibility information can be found in AccessibleSwitchCell.swift */
}
