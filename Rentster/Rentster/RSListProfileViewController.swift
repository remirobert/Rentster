//
//  RSListProfileViewController.swift
//  Rentster
//
//  Created by Remi Robert on 08/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit

class RSListProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var goods = Array<Good>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "GoodsCellTableViewCell", bundle: nil), forCellReuseIdentifier: "itemCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        User.getUserPosts { (goods) -> () in
            if let goods = goods {
                self.goods = goods
                self.tableView.reloadData()
            }
        }
    }
}

extension RSListProfileViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}

extension RSListProfileViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goods.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell") as! GoodsCellTableViewCell
        
        cell.labelTitle.text = self.goods[indexPath.row].title
        return cell
    }
}
