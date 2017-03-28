//
//  ViewController.swift
//  SwiftLINEPush1
//
//  Created by Takanori.H on 2017/03/28.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tap(_ sender: AnyObject) {
        
        startPush()
        
    }
    
    // Push通知に関するメソッド
    func startPush(){
        
        let content = UNMutableNotificationContent() //content.title = "タイトル"
        //content.subtitle = "サブタイトル"
        
        content.body = ""
        
        //どのタイミングでPush通知を発動させるか
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let requestidentifier = "LINEPush"
        let request = UNNotificationRequest(identifier: requestidentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request,withCompletionHandler:{error in
            //エラー処理
        })

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

