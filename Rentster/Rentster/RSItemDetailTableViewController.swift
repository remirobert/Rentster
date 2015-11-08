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

        self.view.backgroundColor = UIColor.whiteColor()
        
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
    
    tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)
}
