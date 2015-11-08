//
//  UIStoryboard+Instance.swift
//  Wizzem
//
//  Created by Remi Robert on 26/10/15.
//  Copyright © 2015 Remi Robert. All rights reserved.
//

import UIKit

extension UIStoryboard {

    class func instanceController(identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(identifier)
    }
}
