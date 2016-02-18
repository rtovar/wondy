//
//  WDImageCell.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 18/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit
import AlamofireImage

class WDImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    
    func setImageURL(imageURL: String) {
        let imageURL = NSURL(string: imageURL)
        imageView.af_setImageWithURL(imageURL!)
    }
}
