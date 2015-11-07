//
//  RSPreviewPictureViewController.swift
//  Rentster
//
//  Created by Remi Robert on 07/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit

class RSPreviewPictureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    var decriptionGood: String!
    
    lazy var labelDescription: UILabel! = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.whiteColor()
        label.text = self.decriptionGood
        label.font = UIFont.systemFontOfSize(15)
        return label
    }()
    
    func dismissController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.labelDescription)
        let size = self.labelDescription.sizeThatFits(CGSizeMake(CGRectGetWidth(UIScreen.mainScreen().bounds) - 10, 2000))
        self.labelDescription.frame = CGRectMake(5, CGRectGetHeight(UIScreen.mainScreen().bounds) - size.height - 5, size.width, size.height)
        self.imageView.image = self.image
        let tapGesture = UITapGestureRecognizer(target: self, action: "dismissController")
        self.view.addGestureRecognizer(tapGesture)
    }
}
