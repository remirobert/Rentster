//
//  RSHomePageController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/4.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSHomePageController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var searchBar = UISearchBar(frame: CGRectMake(500.0,0.0,250.0,44.0))
        
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

//UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(500.0f,0.0f,250.0f,44.0f)];
//searchBar.delegate = self;
//[searchBar setPlaceholder:@"搜索"];

//将搜索条放在一个UIView上
//UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 768, 44)];
//searchView.backgroundColor = [UIColor clearColor];
//[searchView addSubview:searchBar];

//self.navigationItem.titleView = searchView;
