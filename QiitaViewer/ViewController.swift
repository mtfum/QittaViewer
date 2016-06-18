//
//  ViewController.swift
//  QiitaViewer
//
//  Created by Fumiya Yamanaka on 2016/06/15.
//  Copyright © 2016年 fumiya yamanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var articles = [Article]() // 記事を入れるプロパティを定義, 辞書型の配列
    private var webView: UIWebView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "新着記事"
//        articles = ArticleManager.sharedInstance.getArticles()
        ArticleManager.sharedInstance.getArticles() { [weak self] articles in
            guard let me = self else { return }
            me.articles = articles
            me.tableView.reloadData()
        }
        
        webView = UIWebView()
        webView.frame = self.view.bounds
        self.webView.delegate = self
        
    }
}

// tableView
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セルの選択: \(indexPath.row)")
        
        loadURL(indexPath.row)
    }
}

// WebView
extension ViewController: UIWebViewDelegate {
    //MARK: - UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func loadURL(number: Int) {
        self.view.addSubview(webView)
        
        guard let urlString = articles[number].url,
            let  url = NSURL(string: urlString) else { return }
        print(url)
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
    }
}



