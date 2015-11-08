//
//  RSProfileTableViewController.swift
//  Rentster
//
//  Created by Remi Robert on 08/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit
import Parse

class RSProfileTableViewController: UITableViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldWechat: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    
    var header: ViewHeaderProfile!
    
    func editPicture() {
        let controller = UIAlertController(title: "Choose a picture", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let galleryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
            self.photoFromAlbum()
        })
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
            self.photoFromCamera()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        controller.addAction(galleryAction)
        controller.addAction(cameraAction)
        controller.addAction(cancelAction)
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func saveProfile(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFieldEmail.delegate = self
        self.textFieldName.delegate = self
        self.textFieldPhone.delegate = self
        self.textFieldWechat.delegate = self

        self.textFieldEmail.userInteractionEnabled = false
        
        self.textFieldEmail.text = PFUser.currentUser()!["name"] as? String
        
        if let wechat = PFUser.currentUser()!["wechat"] as? String {
            self.textFieldWechat.text = wechat
        }
        if let phone = PFUser.currentUser()!["phone"] as? String {
            self.textFieldPhone.text = phone
        }
        if let name = PFUser.currentUser()!["name"] as? String {
            self.textFieldName.text = name
        }

        self.tableView.delegate = self
        
        self.header = UINib(nibName: "ViewHeaderProfile", bundle: nil).instantiateWithOwner(self, options: nil).first as! ViewHeaderProfile
        self.tableView.tableHeaderView = self.header
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "")
        header.imageView.addGestureRecognizer(tapGesture)
    }
}

extension RSProfileTableViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
}

extension RSProfileTableViewController {
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

extension RSProfileTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if picker.sourceType == UIImagePickerControllerSourceType.Camera {
            let imageToSave: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.header.imageView.image = imageToSave
        }
        else {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.header.imageView.image = image
        }
        self.header.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        picker.dismissViewControllerAnimated(true, completion:nil)
    }
    
    func photoFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion:nil)
        }else {
            print("Can't Find the Camera")
        }
    }
    
    func photoFromAlbum() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion: {
                () -> Void in
            })
        }else {
            print("Error loading the Album")
        }
    }
}
