//
//  QiitaApiModel.swift
//  QiitaFeeds
//
//  Created by hiro on 2015/04/14.
//  Copyright (c) 2015年 hiro. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class QiitaApiModel : NSObject{
    
    dynamic var articles: [[String: String]] = []
    let api_uri = "https://qiita.com/api/v2/items"
    
    override init() {
    }
    
    func lists() -> [[String: String]]{
        return self.articles
    }
    
    func updateLists() {
        var lists: [[String: String]] = []
        Alamofire.request(.GET, self.api_uri, parameters: nil)
            .responseJSON { (req, res, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                    println(req)
                    println(res)
                }
                else {
                    NSLog("Success: \(self.api_uri)")
                    var json = JSON(json!)
                    
                    let count:Int! = json.count
                    for var i = 0; i < count; i++ {
                        lists.append(["title": json[i]["title"].string!, "uri": json[i]["url"].string!])
                    }
                    self.articles = lists
                }
        }
    }
}
