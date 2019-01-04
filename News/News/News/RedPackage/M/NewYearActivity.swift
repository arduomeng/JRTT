//
//  NewYearActivity.swift
//  News
//
//  Created by Lin on 2018/3/28.
//  Copyright © 2018年 Lin. All rights reserved.
//

import UIKit
import HandyJSON

struct NewYearActivity: HandyJSON {
    var background_image: String = ""
    var share_info: String = ""
    var id: Int = 0
    var rain_next_image_url: String = ""
    var content_image_url: String = ""
    var sub_title: String = ""
    var btn_open_url: String = ""
    var btn_style: String = ""
    var activity_title: String = ""
    var btn_label: String = ""
    var can_completed_task_count: Int = 0
    var flag: Int = 0
    var image: String = ""
    var rain_title_image_url: String = ""
    var introduce_url: String = ""
    var card_data = CardData()
    var introduce: String = ""
    var content: String = ""
    var title = ""
    
}
struct CardData: HandyJSON {
    var new_year_count: Int = 0
    var available_card_count: Int = 0
    var bonus_win: String = ""
    var winner_count: Int = 0
    var win_rank: Int = 0
    var cards_status: Int = 0
    var dest_card_list: String = ""
    var bonus_init: String = ""
    var ask_info: String = ""
    var bonus_top_user: String = ""
    var card_gold_user_limit: Int = 0
    var drop_info: String = ""
}

struct Shengxiao: HandyJSON {
    var title: String = ""
    var big: String = ""
    var small = ""
}
