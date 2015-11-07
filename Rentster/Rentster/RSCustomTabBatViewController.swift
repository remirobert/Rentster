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
        addButton.addTarget(self, action: "createNew", forControlEvents: UIControlEvents.TouchUpInside)
        return addButton
    }()
    
    func createNew() {
        self.performSegueWithIdentifier("createSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.addButton)
        self.addButton.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(43)
            make.bottom.equalTo(0)
        }
    }
}
