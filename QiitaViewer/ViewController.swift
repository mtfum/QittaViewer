//
//  ViewController.swift
//  QiitaViewer
//
//  Created by Fumiya Yamanaka on 2016/06/15.
//  Copyright © 2016年 fumiya yamanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var articles = [Article]() // 記事を入れるプロパティを定義, 辞書型の配列
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "新着記事"
        articles = ArticleManager.sharedInstance.getArticles()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell") // subtitleのあるcellをつかう
        if let title: String = articles[indexPath.row].title {
            cell.textLabel?.text = title
        }
        if let userId: String = articles[indexPath.row].userId {
            cell.detailTextLabel?.text = userId
        }
        return cell
    }

}

