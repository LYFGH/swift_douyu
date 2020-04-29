//
//  AnchorModel.swift
//  swift_douyu
//
//  Created by 李亚飞 on 2020/4/28.
//  Copyright © 2020 李亚飞. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    var room_id : Int = 0
    var vertical_src : String = ""
    var isVertical : Int = 0
    var room_name : String = ""
    var nickname : String = ""
    var online : Int = 0
    var anchor_city : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    
    }
}
