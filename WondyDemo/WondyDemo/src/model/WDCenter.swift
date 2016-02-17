//
//  WDCenter.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import Foundation

class WDCenter {
    
    var identifier: String
//    var long: String
//    var lat: String
    var name: String
    var address: String
    var imagesURLs: [String]
//    var services: [String]
//    var description: String
    
    init(identifier: String, name: String, address: String, imagesURLs: [String]) {
        self.identifier = identifier
        self.name = name
        self.address = address
        self.imagesURLs = imagesURLs
    }
    
    init(jsonDict: NSDictionary) {
        self.identifier = jsonDict["id"] as! String
        self.name = jsonDict["name"] as! String
        self.address = jsonDict["address"] as! String
        self.imagesURLs = jsonDict["img"] as! [String]
    }
}