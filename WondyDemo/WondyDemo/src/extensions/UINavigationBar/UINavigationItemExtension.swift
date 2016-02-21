//
//  UINavigationItemExtension.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 20/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    func setTitleImage(imageName: String) {
        self.setTitleImage(imageName, imageTintColor: nil)
    }
    
    func setTitleImage(imageName: String, imageTintColor: UIColor?) {
        let logo = UIImage(named:imageName)
        let imageView = UIImageView(image:logo)
        
        if imageTintColor != nil {
            imageView.image = imageView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            imageView.tintColor = imageTintColor
        }
        
        self.titleView = imageView
    }
}
