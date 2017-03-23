//
//  WebViewController.swift
//  SwiftPokemonTable
//
//  Created by Takanori.H on 2017/03/19.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    
    @IBOutlet var WebView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.co.jp/")
        
        let requestURL = URLRequest(url: url!)
        
        WebView.loadRequest(requestURL)
        
        

    }

    @IBAction func back(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
