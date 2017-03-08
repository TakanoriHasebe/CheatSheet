//
//  ViewController.swift
//  SwiftImageView
//
//  Created by Takanori.H on 2017/03/08.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var backImageView: UIImageView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 1
        
    }
    
    
    @IBAction func change(_ sender: Any) {
        
        
        // backImageViewと名前のついたパーツの
        // 画像を変更する
        
        
        if (count == 0){
            print(count)
            backImageView.image = UIImage(named:"back1.jpg")
            
            count = 1
            print(count)
        }else if(count == 1){
            print(count)
            
            backImageView.image = UIImage(named:"back2.jpg")
            
            count = 0
            print(count)
        }
        
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

