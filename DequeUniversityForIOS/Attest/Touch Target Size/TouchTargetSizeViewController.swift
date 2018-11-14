//
//  TouchTargetSize_Example.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 9/7/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

class TouchTargetSizeViewController: RuleViewController, UITableViewDataSource, UITableViewDelegate {
    
    let TABLEVIEW_REUSABLE_ID = "TableViewCell"
    let NUMBER_OF_SECTIONS = 1
    let NUMBER_OF_ROWS_PER_SECTION = 1
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return NUMBER_OF_SECTIONS
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NUMBER_OF_ROWS_PER_SECTION
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TABLEVIEW_REUSABLE_ID, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath)! as? AccessibleSwitchCell else { return }
        
        cell.a11ySwitch.setOn(!cell.a11ySwitch.isOn, animated: true)
        cell.a11ySwitch.sendActions(for: .valueChanged)
    }
    
    @IBAction func changeBackgroundColor(_ sender: UISwitch) {
        let backgroundView = sender.getAncestorOfClass(BorderedView.self)!
        
        if !sender.isOn {
            backgroundView.backgroundColor = UIColor.clear
        } else {
            backgroundView.backgroundColor = backgroundView.borderColor
        }
    }
}
