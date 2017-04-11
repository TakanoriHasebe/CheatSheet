//
//  ViewController.swift
//  SwiftFacebookLogin
//
//  Created by Takanori.H on 2017/04/10.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

/***********************************
 
 segueとstoryboard両方にidentifier
 がついているということに注意
 
 Facebookログインボタン以外のところは
 https://www.udemy.com/devslopes-ios10/learn/v4/t/lecture/5485180?start=0
 を参照に書かれている
 
 ***********************************/


import UIKit
import FBSDKLoginKit // コピペ
import FBSDKCoreKit // コピペ
import Firebase // コピペ

class ViewController: UIViewController, FBSDKLoginButtonDelegate { // コピペ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // コピペ
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(fbLoginButton)
        
        // コピペ
        fbLoginButton.delegate = self
        
    }
    
    // コピペ
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            
            print("エラーです")
            print(error)
            
        }else if result.isCancelled{
            
            
            
        }else{
            
            // 取得
            self.buttonTapped()
            
            
        }
        
    }
    
    // コピペ
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("ログアウトしました")
    }
    
    // コピペ
    func buttonTapped(){
        performSegue(withIdentifier: "target", sender: nil)
    }
    
    /*
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){
            (result, error) in
            if error != nil{
                print("Unable to authenticate - \(String(describing: error))")
            }else if result?.isCancelled == true{
                print("User canceled Facebook authenticate")
                // self.performSegue(withIdentifier: "target", sender: nil)
            }else{
                
                print("Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                /* こちらを用いても良い */
                // self.performSegue(withIdentifier: "target", sender: nil)
                self.buttonTapped()
            }
            
        }
        
        
    }*/
    
    
    
    /*
    // コピペ
    func firebaseAuth(_ credential: FIRAuthCredential){
        
        FIRAuth.auth()?.signIn(with: credential, completion: {
            (user, error) in
            if error != nil{
                print("Unable to authenticate with Firebase - \(String(describing: error))")
            }else{
                print("Successfully Authenticate with Firebase")
            }
        })
        
    }*/


}

