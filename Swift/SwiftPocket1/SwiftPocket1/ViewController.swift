//
//  ViewController.swift
//  SwiftPocket1
//
//  Created by Takanori.H on 2017/03/28.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var count:Int = 0
    
    @IBOutlet var webView: UIWebView!
    
    var urlArray = [String]()
    var urlString:String? = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "urlArray") != nil{
            
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
            
            urlString = urlArray[count]
            
        }
        
        let requestURL = URL(string: urlString!)
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    
    }


}

