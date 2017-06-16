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
 ①: Firebaseから情報を取得する
*/
//

import UIKit
import Firebase

class MessagesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let ref = Database.database().reference(fromURL: "https://gameofchats-99ef0.firebaseio.com/")
        ref.updateChildValues(["someValue": 123123])*/
        
        // 最初のページの左上のLogoutの表示
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        /* 画像を右上に配置 */
        let image = UIImage(named: "new-message-icon")
        /* handleNewMessage関数を呼び出し */
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        checkIfUserIsLoggedIn()
        
    }
    
    /* Messanger.swiftを呼び出し */
    func handleNewMessage(){
        
        /* 右上に配置された画像が押されたら、NewMessageController.swiftを呼び出す */
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
        
    }
    
    /* userがログインしているかどうか ① */
    func checkIfUserIsLoggedIn(){
        
        // ユーザーがログインしていない場合
        if Auth.auth().currentUser?.uid == nil{
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }else{
            
            /* コピペ */
            /* Firebaseから情報を取得する ① */
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                /* 下記のcodeでnavigationItemのタイトルに名前を表示する */
                if let dictionary = snapshot.value as? [String: AnyObject]{
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
                /* Firebaseから取得した情報の全てを表示 */ 
                // print(snapshot)
                
                // ...
            }) { (error) in
                print(error.localizedDescription)
            }
            
        }
    }
    

    // Login, Logoutに関する関数
    func handleLogout() {
        
        do{
            try Auth.auth().signOut()
        }catch let logoutError{
            print(logoutError)
        }
        
        /* 他のプログラムの関数の呼び出し start 〇 */
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        /* 他のプログラムの関数の呼び出し end 〇   */
        
    }
    
}

