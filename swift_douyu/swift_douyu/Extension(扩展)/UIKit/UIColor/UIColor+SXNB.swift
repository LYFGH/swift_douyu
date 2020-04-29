//
//  UIColor+SXNB.swift
//  SwiftyCreditSteward
//
//  Created by 王嘉倩 on 2018/11/16.
//  Copyright © 2018 王嘉倩. All rights reserved.
//

import Foundation
import UIKit

 extension UIColor {
    
    static  func sxnb_color(forHex hex: String, _ alpha: Double = 1) -> UIColor {
        
        if hex.count != 6 {
            return UIColor.clear
        }
        
        let rIndex = hex.index(hex.startIndex, offsetBy: 2)
        let rString = hex[..<rIndex]
        let otherString = hex[rIndex...]
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString[..<gIndex]
        let bIndex = hex.index(hex.endIndex, offsetBy: -2)
        let bString = hex[bIndex...]
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: String(rString)).scanHexInt32(&r)
        Scanner(string: String(gString)).scanHexInt32(&g)
        Scanner(string: String(bString)).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
        
    }
    
    static  var sxnb_randomColor: UIColor {
        let r = CGFloat(arc4random() % 256) / 255.0
        let g = CGFloat(arc4random() % 256) / 255.0
        let b = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    static  var sxnb_defultText: UIColor {
        return sxnb_color(forHex: "333333")
    }
    
    static  var sxnb_deepGrayText: UIColor {
        return sxnb_color(forHex: "666666")
    }
    
    static  var sxnb_grayText: UIColor {
        return sxnb_color(forHex: "999999")
    }
    
    static  var sxnb_grayBackGround: UIColor {
        return sxnb_color(forHex: "F2F4F6")
    }
    
    static  var sxnb_grayLine: UIColor {
        return UIColor.init(white: 0, alpha: 0.08)
    }
}
