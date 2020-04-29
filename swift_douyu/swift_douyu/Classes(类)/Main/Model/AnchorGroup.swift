//
//  AnchorGroup.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/28.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit

class AnchorGroup: BaseModel {
    
    lazy var anchors : [AnchorModel] = [AnchorModel]()
    var icon_name : String = "home_header_normal"
    var room_list : [[String : Any]]? {
        didSet {
            guard let room_list2 = room_list else { return }
            for dict in room_list2 {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
}
