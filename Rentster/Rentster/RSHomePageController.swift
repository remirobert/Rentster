//
//  RSHomePageController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/4.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSHomePageController: UIViewController , UISearchBarDelegate {
    @IBOutlet weak var scrollView: UIScrollView!

    lazy  var searchBar:UISearchBar = UISearchBar(frame: CGRectMake(0, 0, 200, 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        searchBar.placeholder = "Search"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        setupScrollView()
        
    }
    
    func setupScrollView() {
        let myView = UIView(frame: CGRectMake(0, 0, 580, 70))
        myView.backgroundColor = UIColor.clearColor()
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
