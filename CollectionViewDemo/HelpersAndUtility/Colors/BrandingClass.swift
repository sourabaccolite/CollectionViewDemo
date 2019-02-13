//
//  BrandingClass.swift
//  CollectionViewDemo
//
//  Created by Sourab on 12/02/19.
//  Copyright © 2019 Sourab. All rights reserved.
//

import UIKit

class BrandingClass: NSObject {
    
    //MARK: - Color Methods
    static let lightestPrimaryColor = "#72CFFF"

    static let darkBlackColor = "#5C6275"
    
    
    static let lightTextColor
        = "#E2F3FA"
    static let darkTextColor = "#AAC7DD"
    
    static let backgroundColor = "#FFFFFF"
    
    
    class func getLightestPrimaryColor() -> UIColor {
        return hexStringToUIColor(hex: lightestPrimaryColor)
    }
    
    class func getDarkBlackColor() -> UIColor {
        return hexStringToUIColor(hex: darkBlackColor)
    }
    
    class func getLightTextColor() -> UIColor {
        return hexStringToUIColor(hex: lightTextColor)
    }
    
    class func getDarkTextColor() -> UIColor {
        return hexStringToUIColor(hex: darkTextColor)
    }
    
    class func getBackgroundColor() -> UIColor {
        return hexStringToUIColor(hex: backgroundColor)
    }
    
    //MARK: - Color Convertion
    //This method gives the UIcolor form hex color with Alpha
    static func hexStringToUIColor (hex:String, alpha:Float) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    //This method gives the UIcolor form hex color
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
