//
//  MyCellModel.swift
//  News
//
//  Created by Lin on 2018/5/8.
//  Copyright © 2018年 Lin. All rights reserved.
//

import Foundation
import HandyJSON

struct MyCellModel: HandyJSON {
    
    var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: Int = 0
    
}

struct MyConcern: HandyJSON {
    
    var name: String = ""
    var url: String = ""
    var total_count: Int = 0
    var description: String = ""
    var time: String = ""
    var type: String = ""
    var icon: String = ""
    var userid: Int = 0
    var is_verify: Bool = false
    var media_id: Int = 0
    var tips: Bool = false
    var id: Int = 0
    var user_auth_info = UserAuthInfo()
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int = 0
    var auth_info: String = ""
}
