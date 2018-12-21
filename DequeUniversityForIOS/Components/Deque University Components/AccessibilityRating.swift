//
//  AccessibilityRating.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 12/21/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

@IBDesignable class AccessibilityRating: UIStackView {
    
    private static let OPEN_STAR_IMG_URL = "Star.png"
    private static let FILLED_STAR_IMG_URL = "FilledStar.png"

    private let height: CGFloat = 20

    private var rating: Int = 0
    private var stars: [UIImageView] = []
    
    @IBInspectable var numberOfStars: Int = 5 {
        didSet {
            setup()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public func addStar() {
        if rating >= numberOfStars { return }
        
        stars[rating].image = UIImage(named: AccessibilityRating.FILLED_STAR_IMG_URL)
        rating += 1
    }
    
    public func removeStar() {
        if rating <= 0 { return }
        
        rating -= 1
        stars[rating].image = UIImage(named: AccessibilityRating.OPEN_STAR_IMG_URL)
    }
    
    private func setup() {
        
        destroy()
        
        for _ in 0 ..< numberOfStars {
            
            let star = UIImageView()
            star.image = UIImage(named: AccessibilityRating.OPEN_STAR_IMG_URL)
            
            self.addArrangedSubview(star)
            
            star.heightAnchor.constraint(equalTo: star.widthAnchor).isActive = true
            star.heightAnchor.constraint(equalToConstant: height).isActive = true
            
            stars.append(star)
        }
    }
    
    private func destroy() {
        
        for star in stars {
            self.removeArrangedSubview(star)
            star.removeFromSuperview()
        }
        
        stars.removeAll()
    }
}
