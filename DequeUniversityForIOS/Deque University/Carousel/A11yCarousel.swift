//
//  A11yCarousel.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/14/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class CarouselView: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

class A11yCarousel: UICollectionView {
    
    private let numCells = CarouselViewController.NUM_CELLS
    public var currentItem = IndexPath(row: 0, section: 0)
    
    override public var accessibilityTraits: UIAccessibilityTraits {
        get { return UIAccessibilityTraits.adjustable }
        set { }
    }
    
    override public var accessibilityElements: [Any]? {
        get { return [ self.cellForItem(at: self.currentItem)! ] }
        set { }
    }
    
    override public var accessibilityLabel: String? {
        get { return self.cellForItem(at: self.currentItem)?.accessibilityLabel }
        set { }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.isAccessibilityElement = true
    }
    
    override func accessibilityElementCount() -> Int {
        return 1
    }
    
    override func index(ofAccessibilityElement element: Any) -> Int {
        return currentItem.row
    }
    
    override public func accessibilityScroll(_ direction: UIAccessibilityScrollDirection) -> Bool {
        if direction == .right {
            return scrollToPreviousItem()
        } else if direction == .left {
            return scrollToNextItem()
        }
        
        return false
    }
    
    override public func accessibilityIncrement() {
        _ = scrollToNextItem()
    }
    
    override public func accessibilityDecrement() {
        _ = scrollToPreviousItem()
    }
    
    public func scrollToNextItem() -> Bool {
        let maxRow = numCells - 1
        let nextRow = currentItem.row + 1
        
        if nextRow > maxRow { return false }
        
        scrollToItem(nextRow)
        return true
    }
    
    public func scrollToPreviousItem() -> Bool {
        let minRow = 0
        let prevRow = currentItem.row - 1
        
        if prevRow < minRow { return false }
        
        scrollToItem(prevRow)
        return true
    }
    
    private func scrollToItem(_ rowNum: Int) {
        self.currentItem = IndexPath(row: rowNum, section: currentItem.section)
        scrollToItem(at: self.currentItem, at: .centeredHorizontally, animated: true)
        UIAccessibility.post(notification: UIAccessibility.Notification.pageScrolled,
                             argument: "Page \(rowNum + 1) of \(self.numCells)")
    }
}
