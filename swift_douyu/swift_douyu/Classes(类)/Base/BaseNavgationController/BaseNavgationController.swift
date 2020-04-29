//
//  BaseNavgationController.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/28.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit
import RTRootNavigationController

class BaseNavgationController: RTRootNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transferNavigationBarAttributes = true
    }
    

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
}
