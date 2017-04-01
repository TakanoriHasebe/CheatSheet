//
//  ListTableViewController.swift
//  SwiftPocket1
//
//  Created by Takanori.H on 2017/03/28.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    // WebViewにうつされたタイトル
    var titleArray = [String]()
    
    // WebViewにうつされたurl
    var urlArray = [String]()
    
    var label1:UILabel = UILabel()
    var label2:UILabel = UILabel()
    
    var webView:UIWebView = UIWebView()
    
    // 選択されたセルの番号が入る変数
    var selectedNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // webViewを初期化している
        // webView = UIWebView()
        
        // 非表示にする
        webView.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "titleArray") != nil{
            
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
            
        }
        
        tableView.reloadData()
        
        // サイズを決定する
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.height)
        
        let requestURL = URL(string: "https://www.google.co.jp")
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
        
        // 貼り付ける
        self.view.addSubview(webView)
        
        webView.isHidden = true
        
    }
    
    @IBAction func search(_ sender: AnyObject) {
        
        // サイズを決定する
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.height)
        
        let requestURL = URL(string: "https://www.google.co.jp")
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
        
        // 貼り付ける
        self.view.addSubview(webView)
        
        webView.isHidden = false
        
    }
    

    
    @IBAction func add(_ sender: AnyObject) {
        
        // 非表示にしない
        webView.isHidden = true
        
        // WebViewに表示されているタイトルを配列の中に入れる
        titleArray.append(webView.stringByEvaluatingJavaScript(from: "document.title")!)
        
        // WebViewに表示されているURLを配列の中に入れる
        urlArray.append(webView.stringByEvaluatingJavaScript(from: "document.URL")!)
        
        // 配列をアプリ内へ保存する
        UserDefaults.standard.set(titleArray, forKey: "titleArray")
        UserDefaults.standard.set(titleArray, forKey: "urlArray")
        
        if UserDefaults.standard.object(forKey: "titleArray") != nil{
            
            // 取り出した
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
            
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
            
        }
        
        tableView.reloadData()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        label1 = cell.contentView.viewWithTag(1) as! UILabel
        label2 = cell.contentView.viewWithTag(2) as! UILabel
        
        label1.text = titleArray[indexPath.row]
        label2.text = urlArray[indexPath.row]
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedNumber = Int(indexPath.row)
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "next"){
            
            let viewController:ViewController = segue.destination as! ViewController
            
            viewController.count = selectedNumber
            
        }
        
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
