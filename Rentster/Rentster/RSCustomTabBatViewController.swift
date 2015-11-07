//
//  RSCustomTabBatViewController.swift
//  Rentster
//
//  Created by Remi Robert on 07/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit
import SnapKit

class RSCustomTabBatViewController: UITabBarController {

    lazy var addButton: UIButton! = {
        let addButton = UIButton()
        addButton.backgroundColor = UIColor.redColor()
        return addButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.view.addSubview(self.addButton)
        self.addButton.snp_makeConstraints { (make) -> Void in
//            make
        }
    }
}
