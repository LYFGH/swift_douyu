//
//  Common.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/27.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit



let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
let kMenuViewH : CGFloat = 200


public func kScreenAutoLayoutScaleCeil(_ x: Double) -> CGFloat {
    let scale = kScreenW / 375.0
    return CGFloat(ceil(Double(scale) * x))
}

public let kStatusBarH = UIApplication.shared.statusBarFrame.size.height
public let kNavigationBarH = CGFloat(44.0)
public let kNavigationAndStatusBarHeight = (kStatusBarH+kNavigationBarH)

public var kScreenSafeBottomHeight: CGFloat {
    var bottom = CGFloat(0.0)
    if #available(iOS 11.0, *) {
        bottom = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)!
    }
    return bottom;
}

public let kTabBarH = (kScreenSafeBottomHeight + 49.0)


// MARK: 版本号相关
public let kClientVersion: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
public let kSXNBCurrentSystemVersion = UIDevice.current.systemVersion

public func kClassType(_ className: String) -> AnyClass {
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
    let cls: AnyClass = NSClassFromString(namespace + "." + className)!
    return cls
}



// T的含义: 外界传入什么就是什么
func NJLog<T>(message: T, file: NSString = #file, method: String = #function, line: Int = #line)
{
    #if DEBUG
        print("\(method)[\(line)]: \(message)")
    #endif
}
