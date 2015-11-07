//
//  CreateNewController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/11/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit
import MBProgressHUD
import SAMTextView

class CreateNewController: UITableViewController {

    @IBOutlet weak var imageViewPicture: UIImageView!
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    @IBOutlet weak var textFieldDeposit: UITextField!
    @IBOutlet weak var textViewDescription: UITextField!
    @IBOutlet weak var textFieldStart: UITextField!
    @IBOutlet weak var textFieldEnd: UITextField!
    @IBOutlet weak var buttonSave: UIBarButtonItem!
    
    @IBAction func dismissController(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveNewGood(sender: AnyObject) {
        self.view.endEditing(true)
        if let image = self.imageViewPicture.image,
            let title = self.textFieldTitle.text,
            let price = self.textFieldPrice.text,
            let deposit = self.textFieldDeposit.text {
                
                let newGood = Good()
                newGood.title = title
                newGood.price = Double(price.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()))
                newGood.deposit = Double(deposit.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()))
                newGood.image = image
                newGood.descriptionGood = self.textViewDescription.text
                
                MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                
                Good.createNewGood(newGood, blockCompletion: { (good) -> () in
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                    })
                    if let _ = good {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                    else {
                        let alert = UIAlertView(title: "Error creating new good.", message: "Check your internet connection, and try again.", delegate: nil, cancelButtonTitle: "Ok")
                        alert.show()
                    }
                })
        }
        else {
            let alert = UIAlertView(title: "You need to fill the required filds.", message: nil, delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textViewDescription.placeholder = "Description"
        self.textFieldTitle.delegate = self
        self.textFieldStart.delegate = self
        self.textFieldEnd.delegate = self
        self.textFieldDeposit.delegate = self
        self.textFieldPrice.delegate = self
        
        let headerView = UINib(nibName: "ViewHeaderCreation", bundle: nil).instantiateWithOwner(self, options: nil).first as! ViewHeaderCreation
        self.tableView.tableHeaderView = headerView
    }
}

extension CreateNewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

extension CreateNewController {

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
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
    }
}

extension CreateNewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if picker.sourceType == UIImagePickerControllerSourceType.Camera {
            let imageToSave: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageViewPicture.image = imageToSave
        }
        else {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageViewPicture.image = image
        }
        self.imageViewPicture.contentMode = UIViewContentMode.ScaleAspectFill
        self.imageViewPicture.backgroundColor = UIColor.whiteColor()
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
