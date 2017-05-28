//
//  ViewController.swift
//  SwiftTapPointGet
//
//  Created by Takanori.H on 2017/05/28.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapLocation: CGPoint = CGPoint()
    
    // タップした場所を取得する関数
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // タッチイベントを取得する
        let touch = touches.first
        
        // タップした座標を取得する
        tapLocation = touch!.location(in: self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

