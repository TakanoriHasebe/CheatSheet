//
//  ViewController.swift
//  SwiftUIButtonAnimation
//
//  Created by Takanori.H on 2017/06/13.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var button: UIButton!
    
    /* Buttonに対してanimationをつける */
    @IBAction func animateButton(sender: AnyObject) {
    
        // button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        // button.transform = CGAffineTransform.identity
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* UILongPressGestureの初期化 */
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(_:)))
        longPress.minimumPressDuration = 0.5
        longPress.delaysTouchesBegan = true
        longPress.delegate = self
        self.button.addGestureRecognizer(longPress)
        
    }
    
    /* LongPressされた際の動作を決める関数 */
    func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        
        if gestureRecognizer.state != UIGestureRecognizerState.ended {
            return
        }
        
        print("LongPress")
        
        //呼び出されたタイミングを確認する。
        if (gestureRecognizer.state == UIGestureRecognizerState.ended) {
            print("LongPress Over")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

