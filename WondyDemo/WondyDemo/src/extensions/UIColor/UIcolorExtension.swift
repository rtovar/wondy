//
//  UIcolorExtension.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 20/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        UIColor.whiteColor()
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexColor:Int) {
        self.init(red:(hexColor >> 16) & 0xff, green:(hexColor >> 8) & 0xff, blue:hexColor & 0xff)
    }
    
    public class func themeColor() -> UIColor {
        return UIColor(hexColor: 0xC9646A)
    }
}
