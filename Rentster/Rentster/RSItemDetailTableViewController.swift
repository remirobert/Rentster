//
//  RSItemDetailTableViewController.swift
//  Rentster
//
//  Created by Remi Robert on 07/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit
import SnapKit

class RSItemDetailTableViewController: UITableViewController {

    @IBOutlet weak var imagePreviewPicture: UIImageView!
    
    lazy var contactView: RSContactContactView! = {
        let contactView = UINib(nibName: "RSContactContactView", bundle: nil).instantiateWithOwner(self, options: nil).first as! RSContactContactView
        contactView.buttonContact.addTarget(self, action: "displayContactDetail", forControlEvents: UIControlEvents.TouchUpInside)
        return contactView
    }()
    
    func displayContactDetail() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController!.view.addSubview(self.contactView)
        self.contactView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view)
            make.height.equalTo(50)
            make.bottom.equalTo(-49)
            make.centerX.equalTo(self.view)
        }
        self.contactView.layoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Title item here"
        self.imagePreviewPicture.userInteractionEnabled = false
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 40, 0)
    }
}

extension RSItemDetailTableViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.performSegueWithIdentifier("previewPictureSegue", sender: nil)
        }
    }
}
