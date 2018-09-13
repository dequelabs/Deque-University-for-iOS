//
//  DUStoryTableViewController.swift
//  AttestIOS
//
//  Created by Jennifer Dailey on 8/29/17.
//  Copyright © 2017 Deque Systems Inc. All rights reserved.
//

import UIKit

let DEMO_LABEL_TAG = 101

let REUSABLE_IDENTIFIER = "Demo"

class MenuViewController: UITableViewController {

    // Updating views for dynamic type
    @objc private func didChangePreferredContentSize() {

        let contentSize = UIApplication.shared.preferredContentSizeCategory
        if contentSize == UIContentSizeCategory.extraSmall {
            self.tableView.rowHeight = 36
        } else if contentSize == UIContentSizeCategory.small {
            self.tableView.rowHeight = 40
        } else if contentSize == UIContentSizeCategory.medium {
            self.tableView.rowHeight = 44
        } else if contentSize == UIContentSizeCategory.large {
            self.tableView.rowHeight = 48
        } else if contentSize == UIContentSizeCategory.extraLarge {
            self.tableView.rowHeight = 52
        } else if contentSize == UIContentSizeCategory.extraExtraLarge {
            self.tableView.rowHeight = 56
        } else if contentSize == UIContentSizeCategory.extraExtraExtraLarge {
            self.tableView.rowHeight = 60
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.clearsSelectionOnViewWillAppear = false
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.didChangePreferredContentSize()
        
        // Notification for dynamic type
        NotificationCenter.default.addObserver(self, selector: #selector(didChangePreferredContentSize), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Demos.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let demoName = Demos.values()[indexPath.row].applicableRule().toString()

        let cell = tableView.dequeueReusableCell(withIdentifier: REUSABLE_IDENTIFIER, for: indexPath)
        let cellLabel = cell.viewWithTag(DEMO_LABEL_TAG) as! UILabel

        cellLabel.text = demoName
        cellLabel.isAccessibilityElement = false

        // setting accessibility label
        let demoTab = String.localizedStringWithFormat(" %tu of ", indexPath.row + 1)
        cell.accessibilityLabel = "\(cellLabel.text!), \(demoTab) \(String.localizedStringWithFormat("%lu", Demos.count()))"
            
        // Setting accessibility identifier
        cell.accessibilityIdentifier = cellLabel.text!

        return cell
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pattern = Demos.values()[indexPath.row]
        let viewController = pattern.makeViewController()
            
        viewController.title = "\(pattern.applicableRule().ruleDescription())"
        self.splitViewController!.showDetailViewController(viewController, sender: nil)
    }
}
