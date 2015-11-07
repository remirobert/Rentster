//
//  USer.swift
//  Rentster
//
//  Created by Remi Robert on 08/11/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit
import Parse

class User {

    var contact: ContactUser!
    var email: String!
    var username: String!
    
    class func createUser(object: PFObject) -> User {
        let user = User()

        if let email = object["email"] as? String {
            user.email = email
        }
        if let username = object["name"] as? String {
            user.username = username
        }
        return user
    }
}

extension User {

    class func login(email: String, password: String, blockCompletion:((user: User?)->())) {
        PFUser.logInWithUsernameInBackground(email, password: password) { (user: PFUser?, error: NSError?) -> Void in
            if let user = user where error == nil {
                blockCompletion(user: User.createUser(user))
            }
            else {
                blockCompletion(user: nil)
            }
        }
    }

    class func registerUser(email: String, password: String, username: String, blockCompletion: ((user: User?)->())) {
        let user = PFUser()
        user.username = email
        user.password = password
        user["name"] = username
                
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success && error == nil {
                blockCompletion(user: User.createUser(user))
            }
            else {
                blockCompletion(user: nil)
            }
        }
    }
}
