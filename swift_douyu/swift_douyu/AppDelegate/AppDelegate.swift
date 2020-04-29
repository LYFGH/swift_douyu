//
//  AppDelegate.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/27.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.backgroundColor = .white
        
        self.window?.rootViewController = BaseTabBarViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    


}

