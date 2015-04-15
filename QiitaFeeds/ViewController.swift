//
//  ViewController.swift
//  QiitaFeeds
//
//  Created by hiro on 2015/04/13.
//  Copyright (c) 2015年 hiro. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var articles: [[String: String]] = []
    let qiitaApiModel: QiitaApiModel = QiitaApiModel()
    var listView: ListView?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        qiitaApiModel.addObserver(self, forKeyPath: "articles", options: .New, context: nil)
        qiitaApiModel.updateLists()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listView = ListView(frame: self.view.bounds);
        self.listView!.set(self)
        self.view = self.listView
        
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if(keyPath == "articles"){
            self.articles = qiitaApiModel.lists()
            self.listView!.myTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(articles[indexPath.row]["uri"])
        
        let detailView: DetailViewController = DetailViewController()
        detailView.targetURL = articles[indexPath.row]["uri"]!
        self.presentViewController(detailView, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = articles[indexPath.row]["title"]
        
        return cell
    }


}

