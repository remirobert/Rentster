//
//  RSItemDetailTableViewController.swift
//  Rentster
//
//  Created by Remi Robert on 07/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit
import SnapKit
import Parse
import SAMTextView
import MessageUI

class RSItemDetailTableViewController: UITableViewController {

    var good: Good!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelStart: UILabel!
    @IBOutlet weak var labelEnd: UILabel!

    lazy var headerViewDetail: ViewDetailsHeader! = {
        let headerViewDetail = UINib(nibName: "ViewDetailsHeader", bundle: nil).instantiateWithOwner(self, options: nil).first as! ViewDetailsHeader
        headerViewDetail.imageView.image = nil
        headerViewDetail.imageView.layer.masksToBounds = true
        self.good.fectchImage { (image) -> () in
            if let image = image {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    headerViewDetail.imageView.image = image
                })
            }
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: "displayContactDetail")
        headerViewDetail.addGestureRecognizer(tapGesture)
        return headerViewDetail
    }()
    
    lazy var contactView: RSContactContactView! = {
        let contactView = UINib(nibName: "RSContactContactView", bundle: nil).instantiateWithOwner(self, options: nil).first as! RSContactContactView
        contactView.buttonContact.addTarget(self, action: "displayContactDetail", forControlEvents: UIControlEvents.TouchUpInside)
        return contactView
    }()
    
    func displayContactDetail() {
        self.performSegueWithIdentifier("previewPictureSegue", sender: nil)
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1)
        
        self.title = self.good.title
                
        if let price = self.good.price {
            self.labelPrice.text = "\(price) RMB"
        }
        else {
            self.labelPrice.text = "NA"
        }
        
        if let start = self.good.startDate {
            self.labelStart.text = "Start date : \(start)"
        }
        else {
            self.labelStart.text = "Start date : NA"
        }
        
        if let end = self.good.endDate {
            self.labelEnd.text = "End date : \(end)"
        }
        else {
            self.labelEnd.text = "End date : NA"
        }

        self.tableView.tableHeaderView = self.headerViewDetail
        let footer = UINib(nibName: "ViewFooterDetailItem", bundle: nil).instantiateWithOwner(self, options: nil).first as! UIView
        self.tableView.tableFooterView = footer
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "previewPictureSegue" {
            (segue.destinationViewController as! RSPreviewPictureViewController).image = self.headerViewDetail.imageView.image
            (segue.destinationViewController as! RSPreviewPictureViewController).decriptionGood = self.good.descriptionGood
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {

            if let creator = self.good.creator {
                creator.fetchIfNeededInBackgroundWithBlock({ (user: PFObject?, _) -> Void in
                    if let user = user {
                        let alertController = UIAlertController(title: "Contact", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                        
                        let wechat = user["wechat"]
                        let email = user["username"]
                        let phone = user["phone"]
                        
                        let wechatAction = UIAlertAction(title: "Wechat", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                            self.presentWechat()
                        })
                        
                        let emailAction = UIAlertAction(title: "email", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                            self.presentMailController()
                        })
                        
                        let phoneAction = UIAlertAction(title: "phone", style: UIAlertActionStyle.Default, handler: { (_) -> Void in
                            self.presentPhoneCall(phone as! String)
                        })
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)

                        if wechat != nil {
                            alertController.addAction(wechatAction)
                        }
                        if email != nil {
                            alertController.addAction(emailAction)
                        }
                        if phone != nil {
                            alertController.addAction(phoneAction)
                        }
                        alertController.addAction(cancelAction)
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                })
            }
            self.presentMailController()
        }
    }
}

extension RSItemDetailTableViewController: MFMailComposeViewControllerDelegate {
    
    func presentWechat() {
        if let wechat = PFUser.currentUser()!["wechat"] as? String {
            UIPasteboard.generalPasteboard().string = wechat
        }
    }
    
    func presentPhoneCall(phoneNumber: String) {
        if let phone = PFUser.currentUser()!["phone"] as? String {
            let phoneNumber = "tel:" + phone
            UIApplication.sharedApplication().openURL(NSURL(string: phoneNumber)!)
            
            let alertView = UIAlertView(title: "Wechat id copied !", message: "Now open the wechat app, and contact, the id.", delegate: nil, cancelButtonTitle: "Ok")
            alertView.show()
        }
    }
    
    func presentMailController() {
        let mailController = MFMailComposeViewController()
        mailController.setSubject("[R]enty : \(self.good.title)")
        
        self.good.creator.fetchIfNeededInBackgroundWithBlock { (user: PFObject?, error: NSError?) -> Void in
            if let user = user {
                if let email = user["name"] as? String {
                    mailController.setToRecipients([email])
                }
                mailController.setMessageBody("I am very interesting about your \(self.good.title)", isHTML: false)
                mailController.mailComposeDelegate = self
                self.presentViewController(mailController, animated: true, completion: nil)
            }
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        if result == MFMailComposeResultSent {
            let alert = UIAlertView(title: "Message sent !", message: "Now wait for an aswer with the owner.", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
        }
        else {
            let alert = UIAlertView(title: "Message send failed !", message: "An error appeared when sending mail. Please check your connection and try again", delegate: nil, cancelButtonTitle: "Ok")
            alert.show()
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
