//
//  ViewController.swift
//  YoutubeFacebookLogin
//
//  Created by Takanori.H on 2017/04/12.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//
//  以下のサイトを参考に書かれている
//  https://www.youtube.com/watch?v=iSszeW1aH6I&list=PL0dzCUj1L5JGwSBwZIDlalK1bJph6xNi9&index=1
//
//  ① Facebook developerの設定
//  ② Firebaseの設定
//  ③ GoogleSignInの設定

import UIKit
import FBSDKLoginKit // ①
import Firebase // ②
import GoogleSignIn // ③


class ViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // コピペ①
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(fbLoginButton)
        
        // コピペ①
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email"]*/
        
        // コピペ①
        setupFacebookButton()
        
        setupGoogleButton()
        
        /*
        // コピペ③
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: self.view.frame.size.width/10, y: 100, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        */
        
    }
    
    fileprivate func setupGoogleButton(){
        
        // コピペ③
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: self.view.frame.size.width/10, y: 100, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
    fileprivate func setupFacebookButton(){
        
        // コピペ①
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(fbLoginButton)
        
        // コピペ①
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email"]
        
    }
    
    
    // コピペ①
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            
            print("エラーです")
            print(error)
            return
            
        }else if result.isCancelled{
            
            
            
        }else{
            
            print("ログインしました")
            self.showEmailAddress()
            
        }
        
    }
    
    // ①, ②
    // id, name, emailを取得する
    func showEmailAddress(){
        
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else{ return }
        
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion:{ (user, error) in
            if error != nil{
                print("Firebaseでエラーが発生しています。")
                print(error ?? "")
                return
            }
            
            print("Firebaseのログインに成功しました。")
            print(user ?? "")
        })
        
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, id, email"]).start { (connection, result, err) in
            if err != nil{
                print("Failed to start graph request:", err!)
                return
            }
            
            print(result!)
            
        }

        
    }
    
    // コピペ①
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("ログアウトしました")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

