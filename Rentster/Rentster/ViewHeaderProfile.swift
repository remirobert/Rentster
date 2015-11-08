//
//  ViewHeaderProfile.swift
//  Rentster
//
//  Created by Remi Robert on 08/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit

class ViewHeaderProfile: UIView {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        self.imageView.layer.cornerRadius = 50
        self.imageView.layer.masksToBounds = true
    }
}
