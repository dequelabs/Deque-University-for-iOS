//
//  Color.swift
//  AttestiOSApp
//
//  Created by Jennifer Dailey on 6/11/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let DequeBlue = UIColor.colorWithHexString("0077C8")
    static let DequeDarkGray = UIColor.colorWithHexString("4B4F54")
    static let DequeNavy = UIColor.colorWithHexString("003349")
    static let DequeGreen = UIColor.colorWithHexString("8EDD65")
    static let DequeRed = UIColor.colorWithHexString("E03C31")
    static let DequeBlack = UIColor.colorWithHexString("1E1E1E")
    static let DequeGray = UIColor.colorWithHexString("878787")
    static let DequeWhite = UIColor.colorWithHexString("F5F5F5")

    static private func colorWithHexString(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        // String should be 6 or 8 characters
        if hexString.count < 6 { return UIColor.gray }
        
        if hexString.contains("X") { hexString = String(hexString[hexString.index(of: "X")!...]) }
        
        if hexString.count != 6 { return UIColor.gray }
        
        // Separate into r, g, and b substrings
        var start = hexString.startIndex
        var end = hexString.index(hexString.startIndex, offsetBy: 2)
        let rString = hexString[start..<end]
        
        start = end
        end = hexString.index(hexString.startIndex, offsetBy: 4)
        let gString = hexString[start..<end]
        
        start = end
        end = hexString.endIndex
        let bString = hexString[start..<end]
        
        // Scan values
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        (Scanner.localizedScanner(with: String(rString)) as! Scanner).scanHexInt32(&r)
        (Scanner.localizedScanner(with: String(gString)) as! Scanner).scanHexInt32(&g)
        (Scanner.localizedScanner(with: String(bString)) as! Scanner).scanHexInt32(&b)
        
        return UIColor.init(red: CGFloat(Double(r)/255.0), green: CGFloat(Double(g)/255.0), blue: CGFloat(Double(b)/255.0), alpha: 1)
    }
}
