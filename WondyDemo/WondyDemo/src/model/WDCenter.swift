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
    var name: String
    var address: String
    var imagesURLs: NSMutableArray
    
    init(identifier: String, name: String, address: String, imagesURLs: NSMutableArray) {
        self.identifier = identifier
        self.name = name
        self.address = address
        self.imagesURLs = imagesURLs
    }
}