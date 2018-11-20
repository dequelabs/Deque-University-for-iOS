//
//  ViewController.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/16/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    static let NUM_CELLS = 7
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellID = "CarouselView"
    private let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Carousel Example"
        self.view.backgroundColor = UIColor.DequeNavy
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return CarouselViewController.NUM_CELLS
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CarouselView
        let image = getCellData(indexPath)
        
        cell.imageView.image = image
        cell.accessibilityIdentifier = "CarouselCell_\(indexPath.row + 1)"
        cell.accessibilityLabel = getAccessibilityLabel(indexPath)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - 60
        let height = width
        
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    private func getCellData(_ indexPath: IndexPath) -> UIImage {
        let index = indexPath.row + 1
        let imageName = "cat_\(index).jpg"
        
        return UIImage(named: imageName)!
    }
    
    private func getAccessibilityLabel(_ indexPath: IndexPath) -> String {
        var a11yLabel = ""
        
        switch indexPath.row {
        case 0:
            a11yLabel = "A cat staring up at you."
        case 1:
            a11yLabel = "A cat loafing on its back, arms splayed out."
        case 2:
            a11yLabel = "A resting cat with its head tucked between folded paws."
        case 3:
            a11yLabel = "A collared cat in repose staring at you with piercing eyes."
        case 4:
            a11yLabel = "A cat on a kitchen table staring back at you."
        case 5:
            a11yLabel = "A white kitten leaning over a couch, staring up at the sky."
        case 6:
            a11yLabel = "A close-up of Jessica Borin's cat."
        default:
            a11yLabel = "A cat."
        }
        
        return a11yLabel
    }
    
    
}
