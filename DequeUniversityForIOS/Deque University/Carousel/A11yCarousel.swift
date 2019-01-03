//
//  A11yCarousel.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/14/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let didIncrementCarousel = Notification.Name("didIncrementCarousel")
    static let didDecrementCarousel = Notification.Name("didDecrementCarousel")
    static let didIncrementPager = Notification.Name("didIncrementPager")
    static let didDecrementPager = Notification.Name("didDecrementPager")
}

class CarouselView: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    // Overriding this property allows Switch Control users the ability to scroll between images.
    override public var isAccessibilityElement: Bool {
        get { return true }
        set { }
    }
}

class A11yCarousel: UICollectionView {
    
    private let numCells = CarouselViewController.NUM_CELLS
    private let sectionNum = 0 // Section will always be 0
    
    internal var currentRow = 0
    internal var currentItem: IndexPath {
        return IndexPath(row: currentRow, section: sectionNum)
    }
    
    override public var isAccessibilityElement: Bool {
        get { return true }
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
        self.backgroundColor = UIColor.DequeWhite
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(scrollToNextItem),
                                               name: .didIncrementPager,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(scrollToPreviousItem),
                                               name: .didDecrementPager,
                                               object: nil)
    }
    
    // The Carousel only has one Accessibility Element being displayed at a time.
    override func accessibilityElementCount() -> Int {
        return 1
    }
    
    override func index(ofAccessibilityElement element: Any) -> Int {
        return currentItem.row
    }
    
    // Three finger swipe left/right
    override public func accessibilityScroll(_ direction: UIAccessibilityScrollDirection) -> Bool {
        if direction == .right {
            return scrollTo(nextItem: false)
        } else if direction == .left {
            return scrollTo(nextItem: true)
        }
        
        return false
    }
    
    @objc private func scrollToPreviousItem() {
        let prevItem = self.currentRow - 1
        scrollToItem(prevItem)
    }
    
    @objc private func scrollToNextItem() {
        let nextItem = self.currentRow + 1
        scrollToItem(nextItem)
    }
    
    private func scrollTo(nextItem: Bool) -> Bool {
        var item = self.currentRow - 1
        
        if nextItem {
            item = self.currentRow + 1
        }
        
        if !pageIsInBounds(item) { return false }
        
        scrollToItem(item)
        postNotification(item + 1)
        updatePager(didIncrement: nextItem)
        return true
    }
    
    private func pageIsInBounds(_ page: Int) -> Bool {
        let minPage = 0
        let maxPage = numCells - 1
        
        return page >= minPage && page <= maxPage
    }
    
    @objc private func scrollToItem(_ rowNum: Int) {
        self.currentRow = rowNum
        scrollToItem(at: self.currentItem, at: .centeredHorizontally, animated: true)
    }
    
    private func postNotification(_ pageNum: Int) {
        UIAccessibility.post(notification: .pageScrolled,
                             argument: "Page \(pageNum) of \(self.numCells)")
    }
    
    private func updatePager(didIncrement inc: Bool) {
        var notification: Notification.Name = .didDecrementCarousel
        
        if inc {
            notification = .didIncrementCarousel
        }
        
        NotificationCenter.default.post(name: notification, object: nil)
    }
}
