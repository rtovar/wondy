//
//  WDAPI.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 17/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import Alamofire

class WDAPI {
    
    static let kCentersURL = "https://www.dropbox.com/s/b338h2kcx1vg04o/wondy.json"
    
    class func requestCenters(completionHandler: (result: NSArray) -> Void) {
        Alamofire.request(.GET, kCentersURL, parameters:["raw": "1"]).responseJSON { response in
            let centersArray: NSMutableArray = []
            
            if let JSON = response.result.value {
                for var i = 0; i < JSON.count; ++i {
                    print(i)
                    centersArray.addObject(WDCenter.init(jsonDict: JSON[i] as! NSDictionary))
                }
            }
            
            completionHandler(result: centersArray)
        }
    }
}
