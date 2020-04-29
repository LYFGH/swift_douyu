//
//  UIColor-Extension.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/28.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red: r/255.0 ,green: g/255.0 ,blue: b/255.0 ,alpha:1.0)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
