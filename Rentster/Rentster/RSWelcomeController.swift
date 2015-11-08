//
//  RSWelcomeController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/11/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit
import Parse

class RSWelcomeController: UIViewController {
    
    @IBAction func login(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Login", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        let loginAction = UIAlertAction(title: "Login", style: .Default) { (_) in
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            
            
            User.login(loginTextField.text!, password: passwordTextField.text!, blockCompletion: { (user) -> () in
                if let _ = user {
                    if let instance = UIApplication.sharedApplication().delegate {
                        instance.window!?.rootViewController = UIStoryboard.instanceController("mainController")
                    }
                }
            })
            
        }
        loginAction.enabled = false
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Login"
            textField.keyboardType = UIKeyboardType.EmailAddress
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                loginAction.enabled = textField.text != ""
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addAction(loginAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func signup(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Signup", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Email"
            textField.keyboardType = .EmailAddress
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password Confirmation"
            textField.secureTextEntry = true
        }
        
        let signupAction = UIAlertAction(title: "Signup", style: UIAlertActionStyle.Default) { (_) -> Void in
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            let passwordTextField2 = alertController.textFields![2] as UITextField

            if let password1 = passwordTextField.text, let password2 = passwordTextField2.text, let login = loginTextField.text where password1 == password2 {
                User.registerUser(login, password: password1, username: login, blockCompletion: { (user) -> () in
                    if let _ = user {
                        if let instance = UIApplication.sharedApplication().delegate {
                            instance.window!?.rootViewController = UIStoryboard.instanceController("mainController")
                        }
                    }
                })
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (_) -> Void in }
        
        alertController.addAction(signupAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.toolbarHidden = true
        self.navigationController?.navigationBarHidden = true
        
        if let _ = PFUser.currentUser() {
            if let instance = UIApplication.sharedApplication().delegate {
                instance.window!?.rootViewController = UIStoryboard.instanceController("mainController")
            }
        }
    }
}
