//
//  WDCenterCell.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit
import AlamofireImage

class WDCenterCell: UITableViewCell {
    
    @IBOutlet weak var centerImageView : UIImageView!
    @IBOutlet weak var centerNameLabel : UILabel!
    @IBOutlet weak var centerAddressLabel : UILabel!
    
    func setCenter(center: WDCenter) {
        setupImage(center.imagesURLs)
        centerNameLabel.text = center.name
        centerAddressLabel.text = center.address
    }
    
    func setupImage(imagesURLsArray: NSArray) {
        if imagesURLsArray.count > 0 {
            let imageURL = NSURL(string: imagesURLsArray[0] as! String)
            centerImageView.af_setImageWithURL(imageURL!)
        }
    }
}
