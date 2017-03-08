//
//  ViewController.swift
//  SwiftSegmentedView
//
//  Created by Takanori.H on 2017/03/08.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var BackImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func testSegmentedControl(_ sender: Any) {
        
        //セグメント番号で条件分岐させる
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            BackImageView.image = UIImage(named: "back1.jpg")
        case 1:
            BackImageView.image = UIImage(named: "back2.jpg")
        default:
            BackImageView.image = UIImage(named: "back1.jpg")
        
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

