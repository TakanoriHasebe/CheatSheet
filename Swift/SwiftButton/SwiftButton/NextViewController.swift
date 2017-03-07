//
//  NextViewController.swift
//  SwiftButton
//
//  Created by Takanori.H on 2017/03/06.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var changeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func change(_ sender: Any) {
        
        // ここが呼ばれる
        
        // 次の画面へ書かれたラベルの文字を変更したい
        changeLabel.text = "暗号が解除されました。"
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
