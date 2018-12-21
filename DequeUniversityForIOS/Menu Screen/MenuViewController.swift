//
//  MenuViewController.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 10/27/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class MenuViewController: UICollectionViewController {
    
    private static let SectionHeaders: [String] = [
        "Attest IOS Demos",
        "Deque University Demos"
    ]
    
    private static let DequeUDemos: [String] = [
        "Carousel",
        "Selectable Cells"
    ]
    
    let DEMO_REUSE_ID = "demo"
    let HEADER_REUSE_ID = "sectionHeader"
    let DQU_SECTION = 1
    let ATTEST_SECTION = 0
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    fileprivate var itemsPerRow: CGFloat {
        if UIUserInterfaceIdiom.pad == UI_USER_INTERFACE_IDIOM() {
            return 4
        } else {
            return 2
        }
    }
    
    private var _cellWidth: CGFloat?
    private var _cellHeightPerSection: [CGFloat?] = Array(repeating: nil,
                                                          count: MenuViewController.SectionHeaders.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateForContentSize),
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
    }
    
    @objc private func updateForContentSize() {
        _cellHeightPerSection = Array(repeating: nil,
                                      count: MenuViewController.SectionHeaders.count)
        self.collectionView.reloadData()
    }
    
    private func getCellWidth() -> CGFloat {
        if _cellWidth == nil {
            _cellWidth = calculateCellWidth()
        }
        return _cellWidth!
    }
    
    private func getCellHeight(for section: Int) -> CGFloat {
        if _cellHeightPerSection[section] == nil {
            _cellHeightPerSection[section] = calculateCellHeight(forSection: section)
        }
        return _cellHeightPerSection[section]!
    }
    
    private func getSectionHeadingHeight() -> CGFloat {
        let preferredFont = UIFont.preferredFont(forTextStyle: .title2)
        let height = preferredFont.pointSize + 30
        
        return height
    }
    
    private func calculateCellWidth() -> CGFloat {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        
        return availableWidth / itemsPerRow
    }
    
    // This is a stupid idea for how to calculate the height for all cells accurately
    private func calculateCellHeight(forSection section: Int) -> CGFloat {
        let cellWidth = getCellWidth()
        let heightOfImage = cellWidth * 0.3
        let numItemsInSection = collectionView.numberOfItems(inSection: section)
        var maxHeight: CGFloat = 0
        
        for itemID in 0 ..< numItemsInSection {
            let cellTitle = getCellName(for: IndexPath(item: itemID, section: section))
            let mockedHeading = MockedHeading(text: cellTitle, width: cellWidth - (sectionInsets.left + sectionInsets.right))
            let height = mockedHeading.height + 30 + heightOfImage
            
            if maxHeight < height {
                maxHeight = height
            }
        }
        
        return maxHeight
    }
    
    private func getCellName(for indexPath: IndexPath) -> String {
        if indexPath.section == ATTEST_SECTION {
            return Demos.allCases[indexPath.item].demoTitle()
        } else {
            return MenuViewController.DequeUDemos[indexPath.item]
        }
    }
    
    private func getDemo(for indexPath: IndexPath) -> UIViewController {
        if indexPath.section == ATTEST_SECTION {
            return Demos.allCases[indexPath.item].makeViewController()
        } else {
            var demoName = getCellName(for: indexPath)
            demoName = demoName.replacingOccurrences(of: " ", with: "")
            
            return UIStoryboard(name: demoName, bundle: nil).instantiateInitialViewController()!
        }
    }
    
    private func getCellImage(for indexPath: IndexPath) -> UIImage {
        if indexPath.section == ATTEST_SECTION {
            let rule = Demos.allCases[indexPath.item].toString()
            let imageName = "Rule_\(rule)_Icon.png"
            return UIImage(named: imageName)!
        } else {
            return UIImage(named: "AboutIcon.png")!
        }
    }
    
    private func getHeaderTitle(for section: Int) -> String {
        return MenuViewController.SectionHeaders[section]
    }
}

// Data Source
extension MenuViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        if section == ATTEST_SECTION {
            return Demos.allCases.count
        } else {
            return MenuViewController.DequeUDemos.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: HEADER_REUSE_ID,
                                                                             for: indexPath) as! SectionHeader
            let sectionData = getHeaderTitle(for: indexPath.section)
            headerView.title.text = sectionData
            
            return headerView
        default:
            assert(false, "Unexpected element kind")
            return UICollectionReusableView()
        }
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DEMO_REUSE_ID,
                                                      for: indexPath) as! DemoCell
        let cellName = getCellName(for: indexPath)
        
        cell.title.text = cellName
        cell.imageView.image = getCellImage(for: indexPath)
        cell.imageView.tintColor = UIColor.DequeNavy
        cell.accessibilityIdentifier = cellName
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        let viewController = getDemo(for: indexPath)
        self.navigationController!.pushViewController(viewController, animated: true)
    }
}
    
extension MenuViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = getCellWidth()
        let height = getCellHeight(for: indexPath.section)
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.bottom
    }
        
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let cellWidth = view.frame.width
        let height = getSectionHeadingHeight()
        
        return CGSize(width: cellWidth, height: height)
    }
}


