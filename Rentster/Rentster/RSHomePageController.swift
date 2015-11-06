//
//  RSHomePageController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/4.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSHomePageController: UIViewController , UISearchBarDelegate , UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!

//    lazy  var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width-40, 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        searchBar.placeholder = "Search"
//        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
//        self.navigationItem.leftBarButtonItem = leftNavBarButton
//        setupScrollView()
        //add search bar
        
        let nib = UINib(nibName: "RSHomePageCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "RSHomePageCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupScrollView() {
        let myView = UIView(frame: CGRectMake(0, 0, 580, 70))
        myView.backgroundColor = UIColor.clearColor()
//        these are for catalog
        for(var i = 0 ; i<8 ; i++){
            let button = UIButton(frame: CGRectMake(CGFloat(i * 70)+15, 5 , 60, 60))
            button.setTitle("Btn\(i+1)", forState: UIControlState.Normal)
            button.titleLabel?.textColor = UIColor.blackColor()
            button.backgroundColor = UIColor.blueColor()
            myView.addSubview(button)
        }
        scrollView.addSubview(myView)
        scrollView.contentSize = myView.frame.size
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
//        let nib = UINib(nibName: "RSHomePageCell", bundle: nil)
//        self.tableView.registerNib(nib, forCellReuseIdentifier: "RSHomePageCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItem(sender: AnyObject) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = (self.storyboard?.instantiateViewControllerWithIdentifier("ItemController")) as! RSItemController
        self.navigationController?.pushViewController(item, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RSHomePageCell", forIndexPath: indexPath) as! RSHomePageCell
        cell.cellImage.image = UIImage(named: "pic\(indexPath.row)")
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
}
