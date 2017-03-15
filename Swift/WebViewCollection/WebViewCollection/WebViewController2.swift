//
//  WebViewController2.swift
//  WebViewCollection
//
//  Created by Takanori.H on 2017/03/14.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class WebViewController2: UIViewController, UIWebViewDelegate {

    @IBOutlet var kurukuru: UIActivityIndicatorView!
    
    
    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        
        // URL型に変換している
        let url = URL(string: "https://www.youtube.com")
        let urlRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
        
        // くるくるを非表示にする
        kurukuru.isHidden = true
                
    }
    
    // WebViewにサイトの読み込みが開始された時に勝手に呼ばれるデリゲートメソッド
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        // くるくるを表示
        kurukuru.isHidden = false
        
        // kururkuruを回し始める
        kurukuru.startAnimating()
    }
    
    // WebViewにサイトの読み込みが完了した時に勝手に呼ばれるデリゲートメソッド
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        // kurukuruを非表示にする
        kurukuru.isHidden = true
        
        // kurukuruを止める
        kurukuru.stopAnimating()
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
