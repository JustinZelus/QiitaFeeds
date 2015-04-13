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
    
    dynamic var myItems: Array<String> = []
    
    override init() {
    }
    
    func lists() -> Array<String> {
        Alamofire.request(.GET, "https://qiita.com/api/v2/items", parameters: nil)
            .responseSwiftyJSON { (request, response, json, error) in
                
                let count:Int! = json.count
                for var i = 0; i < count; i++ {
                    self.myItems.append(json[i]["title"].string!)
                }
        }
        return self.myItems
    }
}
