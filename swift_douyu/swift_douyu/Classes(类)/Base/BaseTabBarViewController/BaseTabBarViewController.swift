//
//  BaseTabBarViewController.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/28.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.orange
        setupUI()
    }

}

extension BaseTabBarViewController {
    //MARK: 设置界面
    private  func setupUI(){
        /// 1.添加所有子控制器
        addChildViewControllers()
    }
    
    private func addChildViewControllers(){
        
        // 使用本地数据
        addChildViewController(childControllerName: "HomeViewController", title: "首页", imageName: "btn_home_normal",selectImageName: "btn_home_selected")
        
        addChildViewController(childControllerName: "ColumnViewController", title: "直播", imageName: "btn_column_normal",selectImageName: "btn_Column_selected")
        
        addChildViewController(childControllerName: "LiveViewController", title: "关注", imageName: "btn_live_normal",selectImageName: "btn_live_selected")
        
        addChildViewController(childControllerName: "UserViewController", title: "我的", imageName: "btn_user_normal",selectImageName: "btn_user_selected")
        
        
    }
    
    /**
    添加子控制器
    
    - parameter childControllerName: 控制器的名称
    - parameter title:               控制器标题
    - parameter imageName:           控制器图片
    */
    private func addChildViewController(childControllerName: String?, title: String?, imageName: String?, selectImageName: String?) {
        
        // 0.动态获取命名空间
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]
        
        guard let ns = nameSpace as? String else{
            NJLog(message: "命名空间不存在")
            return
        }
        guard let vcName = childControllerName else
        {
            NJLog(message: "控制器名称是nil")
            return
        }
        
        // 注意: 1.在Swift中, 如果想通过字符串创建一个类, 那么必须加上命名空间
        //       2.动态获取的命名空间是不包含.的, 所以需要我们自己手动拼接
        let cls: AnyClass? = NSClassFromString(ns + "." + vcName)
        
        // 1.将AnyClass类型转换为UIViewController类型
        guard let clsType = cls as? UIViewController.Type else{
            print("传入的字符串不能当做UIViewController来使用")
            return
        }
        
        // 2.根据控制器类类型创建一个控制器对象
        let homeVC = clsType.init()
        
        // 3.添加子控制器
        // 3.1设置子控制器的相关属性
        if let iName = imageName
        {
            homeVC.tabBarItem.image = UIImage(named: iName)
            
            homeVC.tabBarItem.selectedImage = UIImage(named: selectImageName!)
        }
        homeVC.tabBarItem.title = title
//        homeVC.tabBarItem.tit
        // 系统会由内向外的设置标题
//        homeVC.title = title
        
        // 3.2给子控制器包装一个导航控制器
        let nav = BaseNavgationController(rootViewController: homeVC)
        
        // 3.3添加
        addChild(nav)
        
    }
    
    
    
    
    
    
    
}
