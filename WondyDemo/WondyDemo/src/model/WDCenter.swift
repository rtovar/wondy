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
    var long: Double
    var lat: Double
    var name: String
    var address: String
    var imagesURLs: [String]
    var services: [String]
    var description: String
    
    init(jsonDict: NSDictionary) {
        self.identifier = jsonDict["id"] as! String
        self.long = Double(jsonDict["long"] as! String)!
        self.lat = Double(jsonDict["lat"] as! String)!
        self.name = jsonDict["name"] as! String
        self.address = jsonDict["address"] as! String
        self.imagesURLs = jsonDict["img"] as! [String]
        self.services = jsonDict["services"] as! [String]
        self.description = jsonDict["desc"] as! String
    }
}