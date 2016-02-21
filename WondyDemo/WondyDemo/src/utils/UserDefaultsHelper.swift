//
//  UserDefaultsHelper.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 20/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit

class UserDefaultsHelper {
    
    static let kUserImageKey: String = "kUserImageKey"
    static let kUserNameKey: String = "kUserNameKey"
    static let kAllowNotificationsKey: String = "kAllowNotificationsKey"
    
    class func readProfileData () -> (userName: String?, allowNotifications: Bool, userImage: UIImage?) {
        var userName: String?
        var allowNotifications: Bool = false
        var userImage: UIImage?
        
        if userDefaultsContainsKey(kUserNameKey) {
            userName = NSUserDefaults.standardUserDefaults().stringForKey(kUserNameKey)!
        }
        if userDefaultsContainsKey(kAllowNotificationsKey) {
            allowNotifications = NSUserDefaults.standardUserDefaults().boolForKey(kAllowNotificationsKey)
        }
        if userDefaultsContainsKey(kUserImageKey) {
            let userImageData = NSUserDefaults.standardUserDefaults().objectForKey(kUserImageKey) as! NSData
            userImage = UIImage(data: userImageData)
        }
        
        return (userName, allowNotifications, userImage)
    }
    
    class func saveProfileData(userName: String, allowNotifications: Bool, userImage: UIImage?) {
        if userImage != nil {
            let imageData = UIImagePNGRepresentation(userImage!)
            NSUserDefaults.standardUserDefaults().setObject(imageData, forKey: kUserImageKey)
        }
        
        NSUserDefaults.standardUserDefaults().setObject(userName, forKey: kUserNameKey)
        NSUserDefaults.standardUserDefaults().setBool(allowNotifications, forKey: kAllowNotificationsKey)
    }
        
    class func userDefaultsContainsKey(key: String) -> Bool {
        return NSUserDefaults.standardUserDefaults().dictionaryRepresentation().keys.contains(key)
    }
}
