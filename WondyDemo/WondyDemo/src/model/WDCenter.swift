//
//  WDCenter.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import Foundation

class WDCenter {
    let identifier: String
    let name: String
    let address: String
    let imagesURLs: NSMutableArray
    
    init(identifier: String, name: String, address: String, imagesURLs: NSMutableArray) {
        self.identifier = identifier
        self.name = name
        self.address = address
        self.imagesURLs = imagesURLs
    }
}