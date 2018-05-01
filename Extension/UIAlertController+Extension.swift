//
//  UIAlertController+Extension.swift
//  UserNotifiationDemo
//
//  Created by ChenZheng-Yang on 3/30/18.
//  Copyright © 2018 ChenCheng-Yang. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func showConfirmAlert(message: String, in viewController: UIViewController) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        viewController.present(alert, animated: true)
    }
}


