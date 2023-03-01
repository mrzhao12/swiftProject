//
//  HomeModel.swift
//  MySwift
//
//  Created by yinhe on 2019/4/1.
//  Copyright © 2019 yinhe. All rights reserved.
//

import UIKit
import HandyJSON

class HomeModel: HandyJSON {
    
    var id:String?

  
    var original_title:String?
    var images:Dictionary<String, Any>?
    var genres:Array<Any>?
    
// 历史上的今天
    var year:String?
    var title:String?
    var url:String?
    
//    各个平台热搜指数
    var hotScore:String?
    var picurl:String?
    var desc:String?
    //var casts = [NSArray]()
    
    required init(){}

}
