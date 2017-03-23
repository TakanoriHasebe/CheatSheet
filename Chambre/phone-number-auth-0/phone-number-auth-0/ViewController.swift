//
//  ViewController.swift
//  phone-number-auth-0
//
//  Created by Takanori.H on 2017/03/19.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import DigitsKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let digitsButton = DGTAuthenticateButton(authenticationCompletion: { (session, error) in
            // Inspect session/error objects
        })
        self.view.addSubview(digitsButton!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

