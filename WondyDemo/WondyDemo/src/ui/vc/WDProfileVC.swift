//
//  WDProfileVC.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 20/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit

class WDProfileVC: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notificationsSwitch: UISwitch!
    @IBOutlet weak var editImageButton: UIButton!
    
    let kUserNameHint: String = "Write your name here"
    let kAlertControllerCamera: String = "Camera"
    let kAlertControllerGallery: String = "Gallery"
    let kAlertControllerCancel: String = "Cancel"
    let imagePicker = UIImagePickerController()
    
    var userNameStored: String?
    var allowNotificationsStored: Bool = false
    var imageStored: UIImage?
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setTitleImage("wondy_selected", imageTintColor: UIColor.themeColor())
        
        readStoredData()
        setupViewWithStoredData()
        imagePicker.delegate = self
    }
    
    func readStoredData() {
        let storedData = UserDefaultsHelper.readProfileData()
        userNameStored = storedData.userName
        allowNotificationsStored = storedData.allowNotifications
        imageStored = storedData.userImage
    }
    
    func setupViewWithStoredData() {
        imageView.image = imageStored
        if (userNameStored != nil) {
            nameTextView.text = userNameStored
        } else {
            nameTextView.text = kUserNameHint
        }
        notificationsSwitch.on = allowNotificationsStored
    }
    
    //MARK: - IBActions
    
    @IBAction func didTapEditImageButton() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        if UIImagePickerController.isCameraDeviceAvailable(.Rear) || UIImagePickerController.isCameraDeviceAvailable(.Front) {
            actionSheet.addAction(UIAlertAction(title: kAlertControllerCamera, style: .Default, handler: handlerToShowPickerFromCamera()))
        }
        actionSheet.addAction(UIAlertAction(title: kAlertControllerGallery, style: .Default, handler: handlerToShowPickerFromGallery()))
        actionSheet.addAction(UIAlertAction(title: kAlertControllerCancel, style: .Cancel, handler: { (_) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        actionSheet.popoverPresentationController?.sourceView = editImageButton
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func handlerToShowPickerFromCamera() -> ((UIAlertAction) -> Void) {
        return { (_) -> Void in
            self.showImagePicker(.Camera)
        }
    }
    
    func handlerToShowPickerFromGallery() -> ((UIAlertAction) -> Void) {
        return { (_) -> Void in
            self.showImagePicker(.PhotoLibrary)
        }
    }
    
    func showImagePicker(source: UIImagePickerControllerSourceType) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = source
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func didTapSaveButton() {
        userNameStored = nameTextView.text
        allowNotificationsStored = notificationsSwitch.on
        imageStored = imageView.image
        
        UserDefaultsHelper.saveProfileData(userNameStored!, allowNotifications: allowNotificationsStored, userImage: imageStored)
        saveButton.enabled = false
        nameTextView.resignFirstResponder()
    }
    
    @IBAction func didChangeNotificationsSwitch(sender: UISwitch) {
        updateSaveButton()
    }
    
    //MARK: - Save button status
    
    func valuesChanged() -> Bool {
        return nameTextView.text != "" &&
            ((nameTextView.text != kUserNameHint && nameTextView.text != userNameStored) ||
            notificationsSwitch.on != allowNotificationsStored ||
            imageView.image != nil)
    }
    
    func updateSaveButton() {
        saveButton.enabled = valuesChanged()
    }
    
    //MARK: - UITextViewDelegates
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        if textView.text == kUserNameHint {
            textView.text = ""
        }
        
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        updateSaveButton()
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true) { () -> Void in
            self.updateSaveButton()
        }
    }
}
