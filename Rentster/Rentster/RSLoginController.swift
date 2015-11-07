//
//  RSLoginController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/11/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class RSLoginController: UIViewController,UITextFieldDelegate,MBProgressHUDDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var hud = MBProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        hud.delegate = self
        self.view.addSubview(hud)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject) {
        let email = emailField.text
        let password = passwordField.text
        
        if (email as! NSString).length < 6 {
            invalidInput("E-mail")
            return
        }
        if (password as! NSString).length < 6 {
            invalidInput("Password")
            return
        }
        hud.show(true)
        User.login(email!, password: password!) { (user) -> () in
            if let resultuser = user {
                self.hud.hide(true)
                let tabBar = self.storyboard?.instantiateViewControllerWithIdentifier("CustomTabBatViewController") as! RSCustomTabBatViewController
                self.presentViewController(tabBar, animated: true, completion: {})
            }
        }
    }
    
    func invalidInput(type:String) {
        let alert = UIAlertController(title: "Invalid Input", message: "Please Input A Valid "+type, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: {})
    }

    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (string == "\n") {
            textField.resignFirstResponder()
            return false
        }
        return true
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
