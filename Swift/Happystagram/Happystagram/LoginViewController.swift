//
//  LoginViewController.swift
//  Happystagram
//
//  Created by Takanori.H on 2017/06/02.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "check") == nil{
            
        }else{
            
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "login")
            self.present(loginViewController!, animated: true, completion: nil)
            
        }
        
    }
    

    @IBAction func createNewUser(_ sender: AnyObject) {
        
        if emailTextField.text == nil || passTextField.text == nil{
            
            let alertViewController = UIAlertController(title: "おっと。", message: "入力欄が空の状態です", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertViewController.addAction(okAction)
            self.present(alertViewController, animated: true, completion: nil)
            
            
        }else{
            
            /* 新規のツーザー登録 */
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passTextField.text!, completion: { (user, error) in
                
                //成功したとき
                if error == nil{
                    
                    // 成功
                    UserDefaults.standard.set("check", forKey: "check")
                    
                    self.dismiss(animated: true, completion: nil)
                    
                    
                    
                }else{
                    //失敗したとき
                    let alertViewController = UIAlertController(title: "おっと。", message: "入力欄が空の状態です", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertViewController.addAction(okAction)
                    self.present(alertViewController, animated: true, completion: nil)
                    
                    
                }
                
                
            })
            
        }
        
        
        
        
    }
    
    @IBAction func userLogin(_ sender: AnyObject) {
        
        /* ログイン */
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passTextField.text!, completion: { (user, error) in
            
            //成功したとき
            if error == nil{
                
                
                
            }else{
                //失敗したとき
                let alertViewController = UIAlertController(title: "おっと。", message: "入力欄が空の状態です", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertViewController.addAction(okAction)
                self.present(alertViewController, animated: true, completion: nil)

                
                
            }
            
            
        })
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }

}
