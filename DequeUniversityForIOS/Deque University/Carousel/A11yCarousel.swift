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
    
    // Overriding this property allows Switch Control users the ability to scroll between images.
    override public var isAccessibilityElement: Bool {
        get { return true }
        set { }
    }
}

class A11yCarousel: UICollectionView {
    
    private let numCells = CarouselViewController.NUM_CELLS
    public var currentItem = IndexPath(row: 0, section: 0)
    
    // VoiceOver users have the ability to swipe up/down to scroll through the images, or can use the typical "three finger swipe" to scroll to the next image.  This acts very similarly to using VoiceOver on the home screen.
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
            return scrollToPreviousItem()
        } else if direction == .left {
            return scrollToNextItem()
        }
        
        return false
    }
    
    // This ability is given when the trait "adjustable" is used. Swipe up with one finger to increment the page number.
    override public func accessibilityIncrement() {
        _ = scrollToNextItem()
    }
    
    // This ability is given when the trait "adjustable" is used. Swipe down with one finger to decrement the page number.
    override public func accessibilityDecrement() {
        _ = scrollToPreviousItem()
    }
    
    private func scrollToNextItem() -> Bool {
        let maxRow = numCells - 1
        let nextRow = currentItem.row + 1
        
        if nextRow > maxRow { return false }
        
        scrollToItem(nextRow)
        return true
    }
    
    private func scrollToPreviousItem() -> Bool {
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
