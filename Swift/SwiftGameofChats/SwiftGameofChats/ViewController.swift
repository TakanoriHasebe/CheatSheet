//
//  ViewController.swift
//  SwiftGameofChats
//
//  Created by Takanori.H on 2017/06/07.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//
//
/*
 〇: 参考になったプログラムの書き方
 ①:
*/
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let ref = Database.database().reference(fromURL: "https://gameofchats-99ef0.firebaseio.com/")
        ref.updateChildValues(["someValue": 123123])*/
        
        // 最初のページの左上のLogoutの表示
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    

    // Login, Logoutに関する関数
    func handleLogout() {
        
        /* 他のプログラムの関数の呼び出し start 〇 */
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        /* 他のプログラムの関数の呼び出し end 〇   */
        
    }
    
}

