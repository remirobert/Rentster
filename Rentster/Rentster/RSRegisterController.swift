//
//  RSRegisterController.swift
//  Rentster
//
//  Created by Shepard Wang on 15/11/7.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSRegisterController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        //do any connecting thing
    }

    func invalidInput(type:String) {
        let alert = UIAlertController(title: "Invalid Input", message: "Please Input A Valid "+type, preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alert, animated: true, completion: {})
    }
    
    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
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
