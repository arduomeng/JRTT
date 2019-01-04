//
//  TNTabBarController.swift
//  News
//
//  Created by Lin on 2018/3/20.
//  Copyright © 2018年 Lin. All rights reserved.
//

import UIKit

class TNTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"
        
        addChildViewControllers()
        
    }
    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home", selectedImageName: "")
        setChildViewController(VideoViewController(), title: "西瓜视频", imageName: "video", selectedImageName: "")
        //        setChildViewController(RedPackageViewController(), title: "", imageName: "redpackage")
        setChildViewController(RedPackageViewController(), title: "", imageName: "redpackage", selectedImageName: "")
        setChildViewController(WeitoutiaoViewController(), title: "微头条", imageName: "weitoutiao", selectedImageName: "")
        setChildViewController(HuoshanViewController(), title: "小视频", imageName: "huoshan", selectedImageName: "")
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        //        setValue(MyTabBar(), forKey: "tabBar")
    }

    private func setChildViewController(_ childViewController: UIViewController, title: String, imageName: String, selectedImageName: String) {
        
        // 设置 tabbar 文字和图片
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childViewController, imageName: imageName)
        } else {
            setDayChildController(controller: childViewController, imageName: imageName)
        }
        childViewController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        let navVc = TNNavigationController(rootViewController: childViewController)
        addChildViewController(navVc)
        
    }
    
    /// 设置夜间控制器
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    /// 设置日间控制器
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
