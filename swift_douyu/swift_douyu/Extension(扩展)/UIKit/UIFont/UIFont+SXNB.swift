//
//  UIFont+SXNB.swift
//  SwiftyCreditSteward
//
//  Created by 王嘉倩 on 2018/11/16.
//  Copyright © 2018 王嘉倩. All rights reserved.
//

import Foundation
import UIKit

 extension UIFont {
    
    static func sxnb_thin(ofSize fontSize: CGFloat) -> UIFont {
        let font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        guard font != nil else {
            return UIFont.systemFont(ofSize:fontSize)
        }
        return font!
    }
    
    static  func sxnb_normal(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: fontSize)
    }
    
    static  func sxnb_blod(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: fontSize)
    }
    
    static  func sxnb_pfSCMedium(ofSize fontSize: CGFloat) -> UIFont {
        let font = UIFont(name: "PingFangSC-Medium", size: fontSize)
        guard font != nil else {
            return UIFont.systemFont(ofSize:fontSize)
        }
        return font!
    }
    
    static  func sxnb_pfSCRegular(ofSize fontSize: CGFloat) -> UIFont {
        let font = UIFont(name: "PingFangSC-Regular", size: fontSize)
        guard font != nil else {
            return UIFont.systemFont(ofSize:fontSize)
        }
        return font!
    }
    
    static  func sxnb_pfSCLight(ofSize fontSize: CGFloat) -> UIFont {
        let font = UIFont(name: "PingFangSC-Light", size: fontSize)
        guard font != nil else {
            return UIFont.sxnb_thin(ofSize:fontSize)
        }
        return font!
    }
    
    static  func sxnb_pfSCSemibold(ofSize fontSize: CGFloat) -> UIFont {
        let font = UIFont(name: "PingFangSC-Semibold", size: fontSize)
        guard font != nil else {
            return UIFont.sxnb_pfSCMedium(ofSize:fontSize)
        }
        return font!
    }
    
    static  func sxnb_numOfDINMittelschrift(ofSize fontSize: CGFloat) -> UIFont {
        let font = UIFont(name: "DINMittelschrift", size: fontSize)
        guard font != nil else {
            UIFont.loadFont(fontName: "DINMittelschrift.otf")
            if let numFont = UIFont(name: "DINMittelschrift", size: fontSize) {
                return numFont
            }
            return UIFont.systemFont(ofSize:fontSize)
        }
        return font!
    }
    
    private static func loadFont(fontName: String) -> Void {
        
        let mainBundlePath = Bundle.main.bundlePath
        let bundlePath = mainBundlePath + "/UIFont.bundle";
        let bundle = Bundle(path: bundlePath)
        
        guard bundle != nil else {
            return
        }
    
        let resourcePath = bundle!.bundlePath + "/" + fontName
        
        let url = URL(fileURLWithPath: resourcePath)
        
        do {
            let fontData = try Data(contentsOf: url)
            var provider: CGDataProvider? = CGDataProvider(data: fontData as CFData)
            
            guard provider != nil else {
                return
            }
            
            var font: CGFont? = CGFont(provider!)
            guard font != nil else {
                return
            }
 
            if CTFontManagerRegisterGraphicsFont(font!, nil) == false {
                print("error")
            }
            
            
            font = nil
            provider = nil
            
        } catch  {}
        
    }
}
