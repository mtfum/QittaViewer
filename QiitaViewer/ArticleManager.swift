//
//  ArticleManager.swift
//  QiitaViewer
//
//  Created by Fumiya Yamanaka on 2016/06/16.
//  Copyright © 2016年 fumiya yamanaka. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

// 値の受け渡しの実装, APIに関わる処理
class ArticleManager {
    static let sharedInstance = ArticleManager() // シングルトン実装

    func getArticles(callBackClosure: ([Article]) -> ()) {
//    func getArticles() -> [Article] {
        let urlString: String = "https://qiita.com/api/v2/items"
        var articles = [Article]() // 記事を入れるプロパティを定義, 辞書型の配列

        Alamofire.request(.GET, urlString).responseJSON { response in
            guard let object = response.result.value else { return }
            let json = JSON(object)
            json.forEach { (_, json) in
//                nilチェック！
                guard let title = json["title"].string,
                    let userId = json["user"]["id"].string,
                    let url = json["url"].string else { return }
                
                let article = Article(title: title, userId: userId, url: url)
                articles.append(article) // 配列に入れる
            }
            callBackClosure(articles)
        }
//        return articles
    }
    
}
