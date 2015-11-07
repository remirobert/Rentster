//
//  RSPreviewPictureViewController.swift
//  Rentster
//
//  Created by Remi Robert on 07/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit

class RSPreviewPictureViewController: UIViewController {

    func dismissController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "dismissController")
        self.view.addGestureRecognizer(tapGesture)
    }
}
