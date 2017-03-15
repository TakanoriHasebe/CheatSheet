//
//  ViewController.swift
//  SwiftTextField
//
//  Created by Takanori.H on 2017/03/12.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var aiueoTextField: UITextField!
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aiueoTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // キーボードのリターンキーが押された時に勝手に呼ばれる箇所（デリゲートメソッド）
        aiueoTextField.becomeFirstResponder()
        
        // aiueoTextField.テキストをlabelへのテキストにする
        label.text = aiueoTextField.text
        
        // キーボードを閉じる
        aiueoTextField.resignFirstResponder()
        
        return true
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

