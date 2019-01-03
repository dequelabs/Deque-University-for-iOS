//
//  CarouselPager.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 12/2/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class CarouselPager: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        self.pageIndicatorTintColor = UIColor.DequeGray
        self.currentPageIndicatorTintColor = UIColor.DequeNavy
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(incrementPage),
                                               name: .didIncrementCarousel,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(decrementPage),
                                               name: .didDecrementCarousel,
                                               object: nil)
    }
    
    override func accessibilityIncrement() {
        super.accessibilityIncrement()
        NotificationCenter.default.post(name: .didIncrementPager, object: nil)
    }
    
    override func accessibilityDecrement() {
        super.accessibilityDecrement()
        NotificationCenter.default.post(name: .didDecrementPager, object: nil)
    }
    
    @objc private func incrementPage() {
        self.currentPage += 1
    }
    
    @objc private func decrementPage() {
        self.currentPage -= 1
    }
}
