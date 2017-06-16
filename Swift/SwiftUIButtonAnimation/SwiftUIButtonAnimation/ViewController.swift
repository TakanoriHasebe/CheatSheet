//
//  ViewController.swift
//  SwiftUIButtonAnimation
//
//  Created by Takanori.H on 2017/06/13.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import WYMaterialButton

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var button: UIButton!
    
    /* TapやLongPressに対してAnimationを作成したい時は
       Tap関数、LongPress内に記述 */
    /* Buttonに対してanimationをつける */
    @IBAction func animateButton(sender: AnyObject) {
    
        button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        button.transform = CGAffineTransform.identity
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* UILongPressGestureの初期化 */
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(_:)))
        longPress.minimumPressDuration = 0.0
        longPress.delaysTouchesBegan = true
        longPress.delegate = self
        self.button.addGestureRecognizer(longPress)
        
    }
    
    /* LongPressされた際の動作を決める関数 */
    func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        
        if( gestureRecognizer.state == UIGestureRecognizerState.began) {
            print("Long Press Begin")
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }else if (gestureRecognizer.state == UIGestureRecognizerState.ended) {
            button.transform = CGAffineTransform.identity
            print("Long Press Over")
        }
        
    }
    
    @IBOutlet weak var wyButton: WYMaterialButton!
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

