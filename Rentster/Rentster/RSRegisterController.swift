//
//  RSRegisterController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/11/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class RSRegisterController: UIViewController , UITextFieldDelegate,MBProgressHUDDelegate{

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    var hud = MBProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        nameField.delegate = self
        hud.delegate = self
        self.view.addSubview(hud)
    }
    
    @IBAction func register(sender: AnyObject) {
        let email = emailField.text
        let name = nameField.text
        let password = passwordField.text
        
        if (name as! NSString).length > 20 || (name as! NSString).length < 6 {
            invalidInput("Name")
            return
        }
        if (password as! NSString).length > 20 || (password as! NSString).length < 6 {
            invalidInput("Password")
            return
        }
        if (email as! NSString).length < 5 {
            invalidInput("E-mail")
            return
        }
        hud.show(true)
        User.registerUser(email!, password: password!, username: name!) { (user) -> () in
            self.hud.hide(true)
            if let state = user {
                let alert = UIAlertController(title: "Register Successful", message: "Register Successful! Now you can login and enjoy .", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { (_) -> Void in
                    self.navigationController?.popViewControllerAnimated(false)
                }))
                self.presentViewController(alert, animated: true, completion: {})
            } else{
                let alert = UIAlertController(title: "Register Failed", message: "Your E-mail is already used .", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: {})
            }
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (string == "\n") {
            textField.resignFirstResponder()
            return false
        }
        return true
    }

    func regOK() {
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    func invalidInput(type:String) {
        let alert = UIAlertController(title: "Invalid Input", message: "Please Input A Valid "+type, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: {})
    }
    
    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
    }
}
