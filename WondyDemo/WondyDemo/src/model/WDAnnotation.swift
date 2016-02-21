//
//  WDAnnotation.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 20/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import MapKit

class WDAnnotation: NSObject, MKAnnotation {
    var title: String?
    var latitude: Double
    var longitude:Double
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double, title: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
    }
}