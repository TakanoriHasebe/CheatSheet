//
//  ViewController.swift
//  SwiftGoogleLogin
//
//  Created by Takanori.H on 2017/04/11.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

/***********************************
 
 以下のFirebaseを用いいている
 https://console.firebase.google.com/project/project--5153897520292016762/overview
 以下の動画を参照
 https://www.udemy.com/ios10-perfect/learn/v4/t/lecture/6081228?start=0
 
 
 ***********************************/

import UIKit
import Firebase // コピペ
import GoogleSignIn // コピペ


class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コピペ
        // Googleボタンの作成
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: self.view.frame.size.width/10, y: self.view.frame.size.height/1.8, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: 100)
        view.addSubview(googleButton)
        
        // コピペ
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
    }
    
    // コピペ
    // GoogleSignIn
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let err = error{
            
            print("エラーです。", err)
            return
        }
        
        print("成功しました")
        
        guard  let idToken = user.authentication.idToken else {
            return
        }
        
        guard let accessToken = user.authentication.accessToken else{
            return
        }
        
        let credential = FIRGoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user,error) in
            
            if error != nil{
                
                print("エラーです。")
                return
            }
            
            print("成功")
            
            // 画面移動の際に必要になる。
            self.performSegue(withIdentifier: "next", sender: nil)
            
        })
        
    }
    
    // ユーザーの情報を渡す
    // コピペ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "next"){
            
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

