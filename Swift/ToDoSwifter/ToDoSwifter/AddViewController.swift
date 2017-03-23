//
//  AddViewController.swift
//  ToDoSwifter
//
//  Created by Takanori.H on 2017/03/21.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    var array = [String]()
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // 画面が表示されるたびに呼ばれる関数
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
    }
    
    
    @IBAction func add(_ sender: AnyObject) {
        
        // 一旦保存した配列を取り出す処理
        if UserDefaults.standard.object(forKey: "array") != nil{
            
            array = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        
        // 配列arrayの中にtextfieldのテキストを加えていく
        array.append(textField.text!)
        
        // アプリ内にarrayという配列を保存した
        UserDefaults.standard.set(array, forKey: "array")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    

}
