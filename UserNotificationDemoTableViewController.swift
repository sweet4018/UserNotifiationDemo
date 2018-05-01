//
//  UserNotificationDemoTableViewController.swift
//  UserNotifiationDemo
//
//  Created by ChenZheng-Yang on 3/28/18.
//  Copyright © 2018 ChenCheng-Yang. All rights reserved.
//

import UIKit
import UserNotifications

class UserNotificationDemoTableViewController: UITableViewController {

    // MARK: - Propery
    
    enum Segue: String {
        case showEasyNotification
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action
    
    @IBAction func requestAuthorization(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            granted, error in
            if granted {
                // 使用者同意推播
            } else {
                // 使用者拒絕推播
            }
        }
    }

}
