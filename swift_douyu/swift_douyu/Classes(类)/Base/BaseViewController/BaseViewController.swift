//
//  BaseViewController.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/28.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    private var isDefaultBackBtn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.\
        
        self.view.backgroundColor = UIColor.sxnb_color(forHex: "FFFFFF");
        self.automaticallyAdjustsScrollViewInsets = false
        
        if self.navigationController != nil {
            setNavigationBar()
        }
    }
    

    

}

extension BaseViewController {
    //MARK:设置导航栏
    func setNavigationBar(){
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = UIColor.sxnb_defultText;
    self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "navigationBar"), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage.init()
    }
    
    //MARK:返回相应的viewController
    @objc public func backToLastViewController() -> Void {
        if (self.navigationController != nil)
            && (self.navigationController?.viewControllers.count)! > 0
            && (self.navigationController?.viewControllers.first != self.navigationController?.topViewController) {
            self.navigationController!.popViewController(animated: true)
        } else if (self.navigationController != nil) {
            self.navigationController!.dismiss(animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    // MARK: 导航栏相关设置

    public func navBar(title: String?, textColor: UIColor, fontSize: CGFloat) -> Void {
        guard title != nil else {
            self.navigationItem.titleView = nil
            return
        }
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 44))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.sxnb_pfSCRegular(ofSize: fontSize)
        titleLabel.text = title
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
    }
    
    public func leftBarItem(title: String, textColor: UIColor, font: UIFont) -> Void {
        self.isDefaultBackBtn = false
        
        let leftButton = UIButton.init(type: UIButton.ButtonType.custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 80, height:30)
        leftButton.setTitle(title, for: UIControl.State.normal)
        leftButton.setTitleColor(textColor, for: UIControl.State.normal)
        leftButton.titleLabel?.font = font
        leftButton.addTarget(self, action: #selector(BaseViewController.onPressedLeftBarItem), for: UIControl.Event.touchUpInside)
        leftButton.sizeToFit()
        
        let leftBarItem = UIBarButtonItem.init(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarItem
    }

    public func leftBarItem(normalImage: UIImage) -> Void {
        self.isDefaultBackBtn = false
        
        let leftButton = UIButton.init(type: UIButton.ButtonType.custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 80, height:30)
        leftButton.setImage(normalImage, for: UIControl.State.normal)
        leftButton.imageView?.contentMode = .scaleAspectFit
        leftButton.addTarget(self, action: #selector(BaseViewController.onPressedLeftBarItem), for: UIControl.Event.touchUpInside)
        leftButton.sizeToFit()
        
        let leftBarItem = UIBarButtonItem.init(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarItem
    }

    public func rightBarItem(title: String, textColor: UIColor, font: UIFont) -> Void {
        self.isDefaultBackBtn = false
        
        let rightButton = UIButton.init(type: UIButton.ButtonType.custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 80, height:30)
        rightButton.setTitle(title, for: UIControl.State.normal)
        rightButton.setTitleColor(textColor, for: UIControl.State.normal)
        rightButton.titleLabel?.font = font
        rightButton.addTarget(self, action: #selector(BaseViewController.onPressedRightBarItem), for: UIControl.Event.touchUpInside)
        rightButton.sizeToFit()
        
        let rightBarItem = UIBarButtonItem.init(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    
    public func rightBarItem(normalImage: UIImage) -> Void {
        self.isDefaultBackBtn = false
        
        let rightButton = UIButton.init(type: UIButton.ButtonType.custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 80, height:30)
        rightButton.setImage(normalImage, for: UIControl.State.normal)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightButton.addTarget(self, action: #selector(BaseViewController.onPressedRightBarItem), for: UIControl.Event.touchUpInside)
        rightButton.sizeToFit()
        
        let rightBarItem = UIBarButtonItem.init(customView: rightButton)
        self.navigationItem.leftBarButtonItem = rightBarItem
    }
    
    
    @objc open func setDefaultBackBarItem() -> Void {
        self.isDefaultBackBtn = true
    }
    
    
    @objc open func onPressedBackBarButton() -> Void {
        
        self.backToLastViewController()
    }
    
    
    @objc open func onPressedLeftBarItem() -> Void {}
    
    @objc open func onPressedRightBarItem() -> Void {}
    
    
    
}
