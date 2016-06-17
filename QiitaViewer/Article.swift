//
//  Article.swift
//  QiitaViewer
//
//  Created by Fumiya Yamanaka on 2016/06/16.
//  Copyright © 2016年 fumiya yamanaka. All rights reserved.
//

import Foundation

//　ViewControllerが使いたい値の設定, データを格納する箱
class Article {
    
    var title: String
    var userId: String
    var url: String
    
    init(title: String, userId: String, url: String) { // それぞれで型指定しているversion
        self.title = title
        self.userId = userId
        self.url = url
    }
    
//    init(items: [String:String]) { // Dictionary型のversion
//        self.title = items["title"]!
//        self.userId = items["userId"]!
//        self.url = items["url"]!
//    }
    
}
