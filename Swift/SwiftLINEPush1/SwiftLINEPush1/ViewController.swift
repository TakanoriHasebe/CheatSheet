//
//  ViewController.swift
//  SwiftLINEPush1
//
//  Created by Takanori.H on 2017/03/28.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import UserNotifications
import AURCherryBlossomView

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var backView: UIView!
    
    @IBOutlet var whoTextField: UITextField!
    @IBOutlet var honbunTextField: UITextField!
    
    // 結合された文字が入る変数
    
    var resultString = ""
    var ketugouString = ":"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cherryBlossomView = AURCherryBlossomView(frame: self.view.bounds)
        
        backView.addSubview(cherryBlossomView)
        cherryBlossomView.birthRate = 4.0
        
        cherryBlossomView.type = .cherryBlossom
        cherryBlossomView.startBlossom()

        // delegateをimport
        whoTextField.delegate = self
        honbunTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // キーボードのリターンキーが押された時に呼ばれるデリゲートメソッド
        
        // whoTextFieldのテキストと:とhonbunTextFieldのテキストを結合する。
        resultString = whoTextField.text! + ketugouString + honbunTextField.text!
        
        // whoTextFieldのテキスト:honbunTextField.text
        
        
        
        // 閉じる
        textField.resignFirstResponder()
        
        return true
    }

    @IBAction func tap(_ sender: AnyObject) {
        
        startPush()
        
    }
    
    // Push通知に関するメソッド
    func startPush(){
        
        let content = UNMutableNotificationContent()
        //content.title = "タイトル"
        //content.subtitle = "サブタイトル"
        
        content.body = resultString
        
        //どのタイミングでPush通知を発動させるか
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4.0, repeats: false)
        
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

