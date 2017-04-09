//
//  ViewController.swift
//  udemy-facebook-gmail-login
//
//  Created by Takanori.H on 2017/04/05.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import FBSDKLoginKit //
import FBSDKCoreKit //
import Firebase //

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // コピペ
    @IBAction func FacebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){
            (result, error) in
            if error != nil{
                print("Unable to authenticate - \(String(describing: error))")
            }else if result?.isCancelled == true{
                print("User canceled Facebook authenticate")
                // self.performSegue(withIdentifier: "next", sender: nil)
            }else{
                
                print("Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                self.performSegue(withIdentifier: "next", sender: nil)
            }
            
        }
        
    }
    
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
}

