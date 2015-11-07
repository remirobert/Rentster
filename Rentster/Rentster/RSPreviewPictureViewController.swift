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
    
    func dismissController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.image
        let tapGesture = UITapGestureRecognizer(target: self, action: "dismissController")
        self.view.addGestureRecognizer(tapGesture)
    }
}
