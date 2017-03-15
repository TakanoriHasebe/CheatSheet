//
//  ViewController.swift
//  WebViewCollection
//
//  Created by Takanori.H on 2017/03/14.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var kurukuru: UIActivityIndicatorView!
    
    //@IBOutlet var webVIew: UIWebView!
    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
       
        
        // URL型に変換している
        let url = URL(string: "https://www.google.co.jp")
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
    
    
    @IBAction func Next(_ sender: AnyObject) {
        
        webView.goForward()
        
    }
    
    
    @IBAction func Back(_ sender: AnyObject) {
        
        webView.goBack()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

