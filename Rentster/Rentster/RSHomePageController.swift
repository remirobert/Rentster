//
//  RSHomePageController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/4.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit
import SnapKit

class RSHomePageController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentCategory: UISegmentedControl!
    
    lazy var refreshControl: UIRefreshControl! = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "fetchData", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.backgroundColor = UIColor.clearColor()
        return refreshControl
    }()
    
    var goods = Array<Good>()
    var services = Array<Good>()
    
    func fetchData() {
        Good.goodsNearUser { (goods) -> () in
            
            if self.refreshControl.refreshing {
                self.refreshControl.endRefreshing()
            }
            
            if let resultsGood = goods {
                self.goods.removeAll()
                self.services.removeAll()
                
                print("result : \(resultsGood)")
                for currentGood in resultsGood {
                    if let category = currentGood.category {
                        switch category {
                        case GoodCategorie.Good: self.goods.append(currentGood)
                        case GoodCategorie.Service: self.services.append(currentGood)
                        }
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func changeCategory() {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1)
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.contentInset.top = -50
        
        self.segmentCategory.addTarget(self, action: "changeCategory", forControlEvents: UIControlEvents.ValueChanged)
                
        let nib = UINib(nibName: "RSHomePageCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "RSHomePageCell")
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.addSubview(self.refreshControl)
        self.fetchData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailItemSegue" {
            (segue.destinationViewController as! RSItemDetailTableViewController).good = sender as! Good
        }
    }
}

extension RSHomePageController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RSHomePageCell", forIndexPath: indexPath) as! RSHomePageCell
        
        if self.segmentCategory.selectedSegmentIndex == 0 {
            cell.bindCell(self.goods[indexPath.row])
        }
        else {
            cell.bindCell(self.services[indexPath.row])
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.segmentCategory.selectedSegmentIndex == 0 {
            return self.goods.count
        }
        return self.services.count
    }
}

extension RSHomePageController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if self.segmentCategory.selectedSegmentIndex == 0 {
            self.performSegueWithIdentifier("detailItemSegue", sender: self.goods[indexPath.row])
        }
        else {
            self.performSegueWithIdentifier("detailItemSegue", sender: self.services[indexPath.row])
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 245
    }
}

extension RSHomePageController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        if self.searchBar.text == "" {
            self.fetchData()
        }
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        self.goods.removeAll()
        self.tableView.reloadData()
        return true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        Good.searchByString(self.searchBar.text!) { (goods) -> () in
            if let goods = goods {
                self.goods = goods
                self.tableView.reloadData()
            }
            else {
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        Good.searchByString(self.searchBar.text!) { (goods) -> () in
            if let goods = goods {
                self.goods = goods
                self.tableView.reloadData()
            }
            else {
                self.tableView.reloadData()
            }
        }
        return true
    }
}
