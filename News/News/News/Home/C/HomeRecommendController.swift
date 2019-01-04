//
//  HomeRecommendController.swift
//  News
//
//  Created by Lin on 2018/5/3.
//  Copyright © 2018年 Lin. All rights reserved.
//

import UIKit

class HomeRecommendController: HomeTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 注册推荐的 cell
        tableView.cs_register(cell: HomeUserCell.self)
        tableView.cs_register(cell: TheyAlsoUseCell.self)
        tableView.cs_register(cell: HomeCell.self)
    }
}

// MARK: - Table view data source
extension HomeRecommendController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let aNews = news[indexPath.row]
        switch aNews.cell_type {
        case .user:
            return aNews.contentH
        case .relatedConcern:
            return 290
        case .none:
            return aNews.cellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aNews = news[indexPath.row]
        switch aNews.cell_type {
        case .user:             // 用户
            let cell = tableView.cs_dequeueReusableCell(cell:HomeUserCell.self ) as HomeUserCell
            cell.aNews = aNews
            return cell
        case .relatedConcern:   // 相关关注
            let cell = tableView.cs_dequeueReusableCell(cell: TheyAlsoUseCell.self) as TheyAlsoUseCell
            cell.theyUse = aNews.raw_data
            return cell
        case .none:
            let cell = tableView.cs_dequeueReusableCell(cell:HomeCell.self) as HomeCell
            cell.aNews = aNews
            return cell
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var aNews = news[indexPath.row]
//        if indexPath.row == 0 { // 默认设置点击第一个 cell 跳转到图片详情界面
//            let newsDetailImageVC = NewsDetailImageController.loadStoryboard()
//            newsDetailImageVC.isSelectedFirstCell = true
//            aNews.item_id = 6450240420034118157
//            aNews.group_id = 6450237670911852814
//            newsDetailImageVC.aNews = aNews
//            present(newsDetailImageVC, animated: false, completion: nil)
//        } else if (aNews.source == "悟空问答") { // 悟空问答
//            let wendaVC = WendaViewController()
//            wendaVC.qid = aNews.item_id
//            wendaVC.enterForm = .clickHeadline
//            navigationController?.pushViewController(wendaVC, animated: true)
//        } else if aNews.has_video {
//            // 跳转到视频详情控制器
//            let videoDetailVC = VideoDetailViewController()
//            videoDetailVC.video = aNews
//            navigationController?.pushViewController(videoDetailVC, animated: true)
//        }
//    }
}
