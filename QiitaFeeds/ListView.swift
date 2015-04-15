//
//  ListView.swift
//  QiitaFeeds
//
//  Created by zaru on 2015/04/15.
//  Copyright (c) 2015年 hiro. All rights reserved.
//

import Foundation

class ListView:UIView {
    
    var myTableView: UITableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        myTableView = UITableView(frame: frame)
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        self.addSubview(myTableView)
        
        self.backgroundColor = UIColor.greenColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func set(vc: ViewController) {
        myTableView.dataSource = vc
        myTableView.delegate = vc
    }
    
    
}
