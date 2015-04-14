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
    
    var myItems: [[String: String]] = []
    let qiitaApiModel: QiitaApiModel = QiitaApiModel()
    var myTableView: UITableView = UITableView()
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        qiitaApiModel.addObserver(self, forKeyPath: "articles", options: .New, context: nil)
        qiitaApiModel.updateLists()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if(keyPath == "articles"){
            self.myItems = qiitaApiModel.lists()
            self.myTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(myItems[indexPath.row]["uri"])
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = myItems[indexPath.row]["title"]
        
        return cell
    }


}

