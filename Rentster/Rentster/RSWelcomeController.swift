//
//  RSWelcomeController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/11/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSWelcomeController: UIViewController {
    
    @IBAction func login(sender: AnyObject) {
        let loginController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginController") as! RSLoginController
        self.navigationController?.pushViewController(loginController, animated: false)
    }
    
    @IBAction func reg(sender: AnyObject) {
        let regController = self.storyboard?.instantiateViewControllerWithIdentifier("RegisterController") as! RSRegisterController
        self.navigationController?.pushViewController(regController, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.toolbarHidden = true
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
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
