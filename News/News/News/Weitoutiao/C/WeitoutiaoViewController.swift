//
//  WeitoutiaoViewController.swift
//  News
//
//  Created by Lin on 2018/4/18.
//  Copyright © 2018年 Lin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeitoutiaoViewController: HomeTableViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置 UI
        setupUI()
        // 设置刷新控件
        setupRefresh(with: .weitoutiao)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension WeitoutiaoViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let aNews = news[indexPath.row]
        return aNews.weitoutiaoHeight
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cs_dequeueReusableCell(cell: WeitoutiaoCell.self) as WeitoutiaoCell
        cell.aNews = news[indexPath.row]
//        cell.coverButton.rx.controlEvent(.touchUpInside)
//            .subscribe(onNext: { [weak self] in
//                let userDetailVC = UserDetailViewController2()
//                userDetailVC.userId = cell.aNews.user.user_id
//                self?.navigationController?.pushViewController(userDetailVC, animated: true)
//            })
//            .disposed(by: disposeBag)
        // 点击了那张图片
        cell.didSelectCell = { [weak self] (selectedIndex) in
            let previewBigImageVC = PreviewDongtaiBigImageController()
            previewBigImageVC.images = cell.aNews.large_image_list
            previewBigImageVC.selectedIndex = selectedIndex
            self!.present(previewBigImageVC, animated: false, completion: nil)
        }
        return cell
    }
}

extension WeitoutiaoViewController {
    /// 设置 UI
    private func setupUI() {
        // 判断是否是夜间
        ThemeStyle.setupNavigationBarStyle(self, UserDefaults.standard.bool(forKey: isNight))
        // 添加 导航栏左右侧按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: UserDefaults.standard.bool(forKey: isNight) ? "follow_title_profile_night_18x18_" : "follow_title_profile_18x18_"), style: .plain, target: self, action: #selector(leftBarButtonItemClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: UserDefaults.standard.bool(forKey: isNight) ? "short_video_publish_icon_camera_night_24x24_" : "short_video_publish_icon_camera_24x24_"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        // 添加通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
        tableView.cs_register(cell: WeitoutiaoCell.self)
    }
    
    /// 接收到了按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        let selected = notification.object as! Bool
        // 判断是否是夜间
        ThemeStyle.setupNavigationBarStyle(self, UserDefaults.standard.bool(forKey: isNight))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: selected ? "follow_title_profile_night_18x18_" : "follow_title_profile_18x18_"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
    }
    /// 导航栏左侧按钮点击
    @objc private func leftBarButtonItemClicked() {
        
    }
    /// 导航栏右侧按钮点击
    @objc private func rightBarButtonItemClicked() {
        
    }
    
}
