//
//  RSTabBarController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/2.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSTabBarController: UITabBarController ,  BROptionButtonDelegate{
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        var third = self.viewControllers![2]
//        third.delete(nil)
        
        var brOption = BROptionsButton(tabBar: self.tabBar, forItemIndex: 2, delegate: self)
        brOption.setImage(UIImage(named: "Apple"), forBROptionsButtonState: BROptionsButtonStateNormal)
        brOption.setImage(UIImage(named: "Apple"), forBROptionsButtonState: BROptionsButtonStateOpened)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func brOptionsButton(brOptionsButton: BROptionsButton!, imageForItemAtIndex index: Int) -> UIImage! {
        return UIImage(named: "Apple")
    }

    func brOptionsButtonNumberOfItems(brOptionsButton: BROptionsButton!) -> Int {
        return 2;
    }
    
    func brOptionsButton(brOptionsButton: BROptionsButton!, didSelectItem item: BROptionItem!) {
        
    }
    
    func brToDo(){
        print("WOWOO")
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
