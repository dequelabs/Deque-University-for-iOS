//
//  RadioButtonViewController.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 12/20/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import Foundation
import UIKit

class SelectableCells: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let TABLEVIEW_REUSE_ID = "TableCell"
    let NUMBER_OF_SECTIONS = 1
    
    private let colorName = [ "Red", "Orange", "Green", "Blue", "Purple", "Black" ]
    private let colors: [UIColor] = [ .DequeRed, .orange, .DequeGreen, .DequeBlue, .purple, .black ]
    
    private let sectionHeader = A11yLabel()
    
    private var selectedCell = 5
    
    @IBOutlet weak var headerA11yTrait: UISwitch!
    @IBOutlet weak var descriptiveHeader: UISwitch!
    @IBOutlet weak var touchTargetSize: UISwitch!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func reloadTableView() {
        self.tableView.reloadData()
    }
    
    @IBAction func updateHeaderTraits() {
        updateSectionHeaderTraits()
    }
    
    @IBAction func reloadSectionHeader() {
        updateSectionHeader()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Selectable Cells"
        tableView.backgroundColor = UIColor.DequeWhite
        
        descriptiveHeader.onTintColor = UIColor.DequeGreen
        headerA11yTrait.onTintColor = UIColor.DequeGreen
        touchTargetSize.onTintColor = UIColor.DequeGreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableView(tableView, didSelectRowAt: IndexPath(row: selectedCell, section: 0))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return NUMBER_OF_SECTIONS
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLEVIEW_REUSE_ID, for: indexPath)
        let row = indexPath.row
        
        cell.backgroundColor = UIColor.DequeWhite
        cell.textLabel?.text = colorName[row]
        cell.imageView?.image = UIImage(named: "Color.png")!.withRenderingMode(.alwaysTemplate)
        cell.imageView?.tintColor = colors[row]
        
        cell.tintColor = UIColor.DequeBlue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deSelectCell(at: IndexPath(row: selectedCell, section: indexPath.section))
        selectCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if touchTargetSize.isOn {
            return 44.0
        }
        
        return 35.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = setUpSectionHeader()
        updateHeaderTraits()
        
        return header
    }
    
    private func setUpSectionHeader() -> UIView {
        let view = DQView()
        view.addSubview(sectionHeader)
        
        updateSectionHeader()
        
        sectionHeader.font = UIFont.preferredFont(forTextStyle: .headline)
        
        sectionHeader.translatesAutoresizingMaskIntoConstraints = false
        sectionHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
        sectionHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10.0).isActive = true
        sectionHeader.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sectionHeader.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }
    
    private func updateSectionHeader() {
        if descriptiveHeader.isOn {
            sectionHeader.text = "Text Color (#\(selectedCell + 1) selected, \(colors.count) total)"
        } else {
            sectionHeader.text = "Text Color"
        }
    }
    
    private func updateSectionHeaderTraits() {
        if headerA11yTrait.isOn {
            sectionHeader.accessibilityTraits = UIAccessibilityTraits(rawValue:
                UIAccessibilityTraits.header.rawValue | UIAccessibilityTraits.staticText.rawValue)
        } else {
            sectionHeader.accessibilityTraits = UIAccessibilityTraits.staticText
        }
    }
    
    private func selectCell(at indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        selectedCell = indexPath.row
        cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        updateSectionHeader()
    }
    
    private func deSelectCell(at indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = UITableViewCell.AccessoryType.none
    }
}
