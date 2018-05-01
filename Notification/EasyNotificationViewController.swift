//
//  EasyNotificationViewController.swift
//  UserNotifiationDemo
//
//  Created by ChenZheng-Yang on 3/29/18.
//  Copyright © 2018 ChenCheng-Yang. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class EasyNotificationViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Action
    
    /// 幾秒鐘後觸發
    @IBAction func sentNotificationWithUNTimeIntervalNotificationTrigger(_ sender: Any) {
        
        // 1.創建通知內容
        let content = UNMutableNotificationContent()
        content.title = "我是標題"
        content.subtitle = "我是副標題"
        content.body = "我是內容"
        
        // 2.創建觸發條件，這裡是設定5秒後發出通知且不重複，注意這裡不能設定60秒內重複，會crash
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // 3.請求標示符
        let requestIdentifier = "TimeIntervalNotification"
        
        // 4.創建一個發送請求，將我們前面三個步驟所創的東西，丟進來就完成一個發送請求了
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content,
                                            trigger: trigger)
        
        // 5.將請求添加發送中心
        UNUserNotificationCenter.current().add(request) { (error) in
            
            if let error = error {
                // 假如有錯誤就彈跳出警告視窗
                UIAlertController.showConfirmAlert(message: error.localizedDescription, in: self)
            } else {
                print("成功發出一個簡單的通知")
            }
        }
        
    }
    
    /// 在某個時刻觸發
    @IBAction func sentNotificationWithUNCalendarNotificationTrigger(_ sender: Any) {
        
        // 1.創建通知內容
        let content = UNMutableNotificationContent()
        content.title = "我是標題"
        content.subtitle = "我是副標題"
        content.body = "我是內容"
        
        // 2.創建觸發條件，這裡是設定每天8:30
        var date = DateComponents()
        date.hour = 8
        date.minute = 30
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        // 3.請求標示符
        let requestIdentifier = "CalendarNotification"
        
        // 4.創建一個發送請求，將我們前面三個步驟所創的東西，丟進來就完成一個發送請求了
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content,
                                            trigger: trigger)
        
        // 5.將請求添加發送中心
        UNUserNotificationCenter.current().add(request) { (error) in
            
            if let error = error {
                // 假如有錯誤就彈跳出警告視窗
                UIAlertController.showConfirmAlert(message: error.localizedDescription, in: self)
            } else {
                print("成功發出一個簡單的通知")
            }
        }
    }
    
    /// 在某個地點觸發
    @IBAction func sentNotificationWithUNLocationNotificationTrigger(_ sender: Any) {
        
        // 1.創建通知內容
        let content = UNMutableNotificationContent()
        content.title = "我是標題"
        content.subtitle = "我是副標題"
        content.body = "我是內容"
        
        // 2.創建觸發條件，這裡是設定座標經緯度
        let center = CLLocationCoordinate2D(latitude: 37.335400, longitude: -122.009201)
        let region = CLCircularRegion(center: center, radius: 2000.0, identifier: "Headquarters")
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        // 3.請求標示符
        let requestIdentifier = "LocationNotification"
        
        // 4.創建一個發送請求，將我們前面三個步驟所創的東西，丟進來就完成一個發送請求了
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content,
                                            trigger: trigger)
        
        // 5.將請求添加發送中心
        UNUserNotificationCenter.current().add(request) { (error) in
            
            if let error = error {
                // 假如有錯誤就彈跳出警告視窗
                UIAlertController.showConfirmAlert(message: error.localizedDescription, in: self)
            } else {
                print("成功發出一個簡單的通知")
            }
        }
    }
    
}
