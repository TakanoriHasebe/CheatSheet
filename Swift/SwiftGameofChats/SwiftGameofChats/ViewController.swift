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

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 最初のページの左上のLogoutの表示
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }

    // Login, Logoutに関する関数
    func handleLogout() {
        
        // 他のプログラムの関数の呼び出し〇
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
        
    }
    
}

