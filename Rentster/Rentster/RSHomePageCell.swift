//
//  RSHomePageCell.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSHomePageCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelSaveDeposit: UILabel!
    
    override func awakeFromNib() {
        self.cellImage.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        self.cellImage.image = nil
        self.labelTitle.text = nil
        self.labelPrice.text = nil
        self.labelSaveDeposit.text = nil
    }
    
    func bindCell(good: Good) {
        self.labelTitle.text = good.title
        
        self.labelPrice.text = "\(good.price!) RMB"
        
        self.cellImage.image = nil
        good.fectchImage { (image) -> () in
            if let image = image {
                self.cellImage.image = image
            }
        }        
    }
}
