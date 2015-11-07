//
//  RSItemDetailTableViewController.swift
//  Rentster
//
//  Created by Remi Robert on 07/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit
import SnapKit
import SAMTextView

class RSItemDetailTableViewController: UITableViewController {

    var good: Good!
    @IBOutlet weak var imagePreviewPicture: UIImageView!
    @IBOutlet weak var textViewDescription: SAMTextView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelStart: UILabel!
    @IBOutlet weak var labelEnd: UILabel!
    
    lazy var contactView: RSContactContactView! = {
        let contactView = UINib(nibName: "RSContactContactView", bundle: nil).instantiateWithOwner(self, options: nil).first as! RSContactContactView
        contactView.buttonContact.addTarget(self, action: "displayContactDetail", forControlEvents: UIControlEvents.TouchUpInside)
        return contactView
    }()
    
    func displayContactDetail() {
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let navigationBarAppearance = self.navigationController?.navigationBar
        navigationBarAppearance!.setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        navigationBarAppearance!.shadowImage = UIImage()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = self.good.title
        
        self.imagePreviewPicture.image = nil
        self.imagePreviewPicture.layer.masksToBounds = true
        self.good.fectchImage { (image) -> () in
            if let image = image {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.imagePreviewPicture.image = image
                })
            }
        }
        
        if let price = self.good.price {
            self.labelPrice.text = "\(price) RMB"
        }
        else {
            self.labelPrice.text = "NA"
        }
        
        if let description = self.good.descriptionGood {
            self.textViewDescription.text = description
        }
        else {
            self.textViewDescription.placeholder = "No description"
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
        
        self.imagePreviewPicture.userInteractionEnabled = false
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 40, 0)        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "previewPictureSegue" {
            (segue.destinationViewController as! RSPreviewPictureViewController).image = sender as! UIImage
        }
    }
}

extension RSItemDetailTableViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            if let image = self.imagePreviewPicture.image {
                self.performSegueWithIdentifier("previewPictureSegue", sender: image)
            }
        }
    }
}
