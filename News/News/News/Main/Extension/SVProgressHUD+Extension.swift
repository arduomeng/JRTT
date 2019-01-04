//
//  SVProgressHUD+Extension.swift
//  News
//
//  Created by Lin on 2018/4/19.
//  Copyright © 2018年 Lin. All rights reserved.
//

import SVProgressHUD

extension SVProgressHUD {
    /// 设置 SVProgressHUD 属性
    static func configuration() {
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
        SVProgressHUD.setBackgroundColor(UIColor(r: 0, g: 0, b: 0, alpha: 0.3))
    }
}

