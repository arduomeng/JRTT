//
//  RedPackageViewController.swift
//  News
//
//  Created by Lin on 2018/3/20.
//  Copyright © 2018年 Lin. All rights reserved.
//

import UIKit

class RedPackageViewController: UITableViewController {

    /// 新年活动
    var newYearActivities = [NewYearActivity]()
    /// 头部
    private lazy var headerView = RedPackageHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.keyWindow?.theme_backgroundColor = "colors.tableViewBackgroundColor"
    }

    private func setupData() {
        
        let path = Bundle.main.path(forResource: "activity", ofType: "plist")
        let arrActivity = NSArray(contentsOfFile: path!) as! [Any]
        
        /*
         map 可以对一个集合类型的所有元素做一个映射操作
         let stringResult = numbers.map { "No. \($0)" }
        ["No. 1", "No. 2", "No. 3", "No. 4"]
         
         flatMap 它对最终的结果进行了所谓的 “降维” 操作。 本来原始数组是一个二维的， 但经过 flatMap 之后，它变成一维的了
         */
        newYearActivities = arrActivity.flatMap({
            NewYearActivity.deserialize(from: $0 as? [String : Any])
        })
    }
    
    private func setupUI() {
        
        tableView.cs_register(cell: NewYearCardCell.self)
        tableView.cs_register(cell: RedPackageCell.self)
        tableView.cs_register(cell: NewYearOtherCell.self)
        tableView.tableHeaderView = headerView
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(r: 254, g: 230, b: 207)
        
        // 判断是否是夜间
        ThemeStyle.setupNavigationBarStyle(self, UserDefaults.standard.bool(forKey: isNight))
        // 添加通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(NotificationDayOrNightClicked), object: nil)
        
        tableView.reloadData()
    }
    
    /// 接收到了按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        // 判断是否是夜间
        ThemeStyle.setupNavigationBarStyle(self, UserDefaults.standard.bool(forKey: isNight))
    }

}

extension RedPackageViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newYearActivities.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 510
        case 1:
            return 280
        default:
            return 130
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:   // 集生肖
            let cell = tableView.cs_dequeueReusableCell(cell: NewYearCardCell.self)
            
            cell.didSelectCollectionItem = {
                
                let shengxiaoVC = ShengxiaoBigImageViewController(nibName: "ShengxiaoBigImageViewController", bundle: nil)
                shengxiaoVC.shengxiao = $0
                shengxiaoVC.modalSize = (width: .custom(size: Float(screenWidth * 0.75)), height: .custom(size: Float(screenHeight * 0.65)))
                shengxiaoVC.dismissalAnimationType = .dropDown
                shengxiaoVC.presentationAnimationType = .zoom
                self.present(shengxiaoVC, animated: true, completion: nil)
            }
            
            return cell
        case 1:   // 红包雨
            let cell = tableView.cs_dequeueReusableCell(cell: RedPackageCell.self)
            
            return cell
        default:
            let cell = tableView.cs_dequeueReusableCell(cell: NewYearOtherCell.self)
            
            return cell
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 3 {
//            let nextVC = RainNextURLViewController()
//            nextVC.url = newYearActivities[indexPath.row].rain_next_image_url
//            navigationController?.pushViewController(nextVC, animated: true)
//        }
//    }
}
