//
//  ThemeStyle.swift
//  News
//
//  Created by Lin on 2018/3/27.
//  Copyright © 2018年 Lin. All rights reserved.
//

import UIKit

class ThemeStyle: NSObject {

    /// 设置导航栏样式 （日间、夜间）
    static func setupNavigationBarStyle(_ viewController: UIViewController, _ isNight: Bool) {
        if isNight { // 设置夜间主题
            viewController.navigationController?.navigationBar.barStyle = .black
            viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white_night"), for: .default)
            viewController.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.grayColor113()]
        } else {     // 设置日间主题
            viewController.navigationController?.navigationBar.barStyle = .default
            viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white"), for: .default)
        }
    }
}
