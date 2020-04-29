//
//  UIView+SXNB.swift
//  SwiftyCreditSteward
//
//  Created by 王嘉倩 on 2018/11/16.
//  Copyright © 2018 王嘉倩. All rights reserved.
//

import Foundation
import UIKit


 extension UIView {
    
    
    // MARK: ********************** Gesture **********************
    
//     func sxnb_singleTapped(_ action: (SXNBGestureAction<UITapGestureRecognizer>) -> Void = {_ in }) -> Void  {
//        let tap = SXNBTapGestureRecognizer.init()
//        addGestureRecognizer(tap)
//        action(tap.gestureAction)
//    }
    
    
    // MARK: ********************** Corner **********************
    
//     func sxnb_cronerRadii(cornerRadius: CGFloat, corners: UIRectCorner = UIRectCorner.allCorners) -> Void {
//        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
//        let maskLayer = CAShapeLayer.init()
//        maskLayer.frame = self.bounds;
//        maskLayer.path = maskPath.cgPath;
//        self.layer.mask = maskLayer;
//    }
    
    
    // MARK: ********************** BackgroundColor **********************
    
     func sxnb_gradientColor(startColor: UIColor, endColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) -> Void {
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.addSublayer(gradientLayer)
    }
    
    /// 生成当前view的截图
     func snapshotViewToImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        self.layer.render(in: context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    // MARK: ********************** Frame **********************
    
     var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
     var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
     var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
     var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
     var right: CGFloat {
        get {
            return self.left + self.width
        }
        set(newRight) {
            self.frame = CGRect(x: newRight - self.width, y: self.top, width: self.width, height: self.height)
        }
    }
    
     var bottom: CGFloat {
        get {
            return self.top + self.height
        }
        
        set(newBottom) {
            self.frame = CGRect(x: self.left, y: newBottom - self.height, width: self.width, height: self.height)
        }
    }
    
     var centerX: CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
     var centerY: CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
}
