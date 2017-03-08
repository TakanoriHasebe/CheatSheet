//
//  ViewController.swift
//  SwiftCountUp
//
//  Created by Takanori.H on 2017/03/08.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var countLabel: UILabel!
    
    var resultBox = 0 // カウントラベルに反映していく箱
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    @IBAction func plus(_ sender: Any) {
        
        // ラベル(countLabel)に表示する数字をカウントアップさせていく
        
        resultBox = resultBox + 1
        
        // resultBoxの値をcountLabelの文字として代入
        countLabel.text = String(resultBox)
        
    }
    
    
    @IBAction func minus(_ sender: Any) {
        
        // ラベル(countLabel)に表示する数字をカウントダウンさせていく
        
        resultBox = resultBox - 1
        
        countLabel.text = String(resultBox)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

