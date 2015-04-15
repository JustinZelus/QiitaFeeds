//
//  DetailViewController.swift
//  QiitaFeeds
//
//  Created by zaru on 2015/04/15.
//  Copyright (c) 2015年 hiro. All rights reserved.
//

import Foundation

class DetailViewController: UIViewController {
    
    var webView: UIWebView?
    var targetURL = ""
    let myButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = self.createWebView()
        self.view.addSubview(self.webView!)
        var url = NSURL(string: targetURL)
        var request = NSURLRequest(URL: url!)
        self.webView?.loadRequest(request)
        
        myButton.frame = CGRectMake(0,0,200,40)
        myButton.backgroundColor = UIColor.redColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("閉じる", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        myButton.layer.cornerRadius = 20.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y:200)
        myButton.tag = 1
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myButton)
    }
    
    func createWebView() -> UIWebView {
        let _webView = UIWebView()
        _webView.frame = self.view.bounds
        return _webView
    }
    
    func onClickMyButton(sender: UIButton){
        println("onClickMyButton:")
        println("sender.currentTitile: \(sender.currentTitle)")
        println("sender.tag:\(sender.tag)")
        
    }
}