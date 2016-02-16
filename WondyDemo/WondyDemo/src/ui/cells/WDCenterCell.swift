//
//  WDCenterCell.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit
import <Alamofire/UIImageView+AlamofireImage.swift>

class WDCenterCell: UITableViewCell {
    
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var centerNameLabel: UILabel!
    @IBOutlet weak var centerAddressLabel: UILabel!
    
    func setCenter(WDCenter center) {
        let imageURL: NSURL
        imageURL.init(center.im)
        centerImageView.af_setImageWithURL(NSURL)
    }
}
