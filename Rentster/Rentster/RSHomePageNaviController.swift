//
//  RSHomePageNaviController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/4.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSHomePageNaviController: UINavigationController ,UISearchBarDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        var searchBar = UISearchBar(frame: CGRectMake(500,0,250,44))
//        searchBar.delegate = self
//        searchBar.placeholder = "Search"
//        searchBar.backgroundColor = UIColor.redColor()
//        
//        var searchView = UIView(frame: CGRectMake(0, 0, 768, 44))
//        searchView.backgroundColor = UIColor.blueColor()
//        searchView.addSubview(searchBar)
//        
//        self.navigationItem.titleView = searchView
        var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))
//        var leftNavBarButton = UIBarButtonItem(customView:searchBar)
//        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        searchBar.placeholder = "Your placeholder"
        var leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
