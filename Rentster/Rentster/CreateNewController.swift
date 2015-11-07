//
//  CreateNewController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/11/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class CreateNewController: UITableViewController,UIActionSheetDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var wechatField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var itemPriceField: UITextField!
    @IBOutlet weak var safetyDepositField: UITextField!
    @IBOutlet weak var pickDateField: UITextField!
    @IBOutlet weak var dropDateField: UITextField!

    @IBOutlet weak var descView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).CGColor
        descView.layer.borderWidth = 1
        descView.layer.cornerRadius = 5
        descView.layer.masksToBounds = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
//
//        // Configure the cell...
//        
//        print(indexPath.row)
//
//        return cell
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                let actionSheet = UIActionSheet(title: "Pick a Picture", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Album", "Camera")
                actionSheet.showInView(self.view)

            }
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
            case 1:
                photoFromAlbum()
            print("album")
            
            case 2:
                print("cam")
                photoFromCamera()
            
            default:
                break
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
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        print(info)
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        if picker.sourceType == UIImagePickerControllerSourceType.Camera {
            let imageToSave: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            imageView.image = imageToSave
        }
        
        picker.dismissViewControllerAnimated(true, completion: {
            () -> Void in
        })
    }
    
    func photoFromCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            
            let picker = UIImagePickerController()
            
            picker.delegate = self
            
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            
            picker.allowsEditing = true
            
            self.presentViewController(picker, animated: true, completion: { () -> Void in
                
            })
        }else {
            print("Can't Find the Camera")
        }
    }

    
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
