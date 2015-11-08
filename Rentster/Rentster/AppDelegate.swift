//
//  AppDelegate.swift
//  Rentster
//
//  Created by Shepard Wang on 15/10/2.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationAppaerence() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.backgroundColor = UIColor.whiteColor()
        navigationBarAppearance.titleTextAttributes = [NSFontAttributeName: UIFont(name: "ArialRoundedMTBold", size: 18)!,
            NSForegroundColorAttributeName: UIColor(red:0.22, green:0.38, blue:0.74, alpha:1)]
        navigationBarAppearance.tintColor = UIColor(red:0.22, green:0.38, blue:0.74, alpha:1)
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().tintColor = UIColor(red:0.22, green:0.38, blue:0.74, alpha:1)
        UITabBar.appearance().backgroundColor = UIColor.whiteColor()
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.setApplicationId("ghMwfuKhCQhu5wzkOVdsqnLTgPCJSLoJt4OkT8G7", clientKey: "o2dVH9OQ9umCLcNnZL5oTmPLJg4U1l0FJ0wt573i")
        self.applicationAppaerence()
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        var controller: UIViewController!
        
        if let _ = PFUser.currentUser() {
            controller = UIStoryboard.instanceController("mainController")
        }
        else {
            controller = UIStoryboard.instanceController("loginController")
        }
        
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

