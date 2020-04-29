//
//  HomeViewController.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/27.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit

private let kTitleViewH :CGFloat = 40

class HomeViewController: BaseViewController {

    let titles = ["推荐","手游","娱乐","游戏","趣玩"]
    
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: 0, width: kScreenW, height: kTitleViewH)
        let titleView = PageTitleView(frame: titleFrame, titles: (self?.titles)!)
        //MARK:- 控制器作为PageTitleViewDelegate代理
        titleView.delegate = self
        return titleView
    }()
    
    fileprivate lazy var pageContentView : PageContentView = { [weak self] in
            let contentFrame = CGRect(x: 0, y: kTitleViewH, width: kScreenW, height: kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabBarH)
            var childVcs = [UIViewController]()
            childVcs.append(RecommendVC())
            childVcs.append(HandsVC())
            childVcs.append(AmuseVC())
            childVcs.append(GameVC())
            childVcs.append(FunnyVC())
            let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentVc: self)
            //MARK:- 控制器作为PageContentViewDelegate代理
            contentView.delegate = self
            return contentView
        }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 设置UI界面
        setupUI()
    }
    

    

}
extension HomeViewController {
    
    
    private func setupUI(){
        
        //不需要调整scrollview的内边距
        automaticallyAdjustsScrollViewInsets = false
        setupNavigationBar()
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
    }
    
    
    fileprivate func setupNavigationBar() {
        // 1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}


//MARK:- PageTitleViewDelegate代理实现
extension HomeViewController : PageTitleViewDelegate{
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

//MARK:- PageContentViewDelegate代理实现
extension HomeViewController : PageContentViewDelegate{
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
