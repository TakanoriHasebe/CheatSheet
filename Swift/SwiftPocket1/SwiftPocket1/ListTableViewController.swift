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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // webViewを初期化している
        webView = UIWebView()
        
        // サイズを決定する
        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.height)
        
        let requestURL = URL(string: "https://www.google.co.jp")
        let req = NSURLRequest(url: requestURL!)
        webView.loadRequest(req as URLRequest)
        
        // 貼り付ける
        self.view.addSubview(webView)
        
    }

    
    @IBAction func add(_ sender: AnyObject) {
        
        // WebViewに表示されているタイトルを配列の中に入れる
        
        // WebViewに表示されているURLを配列の中に入れる
        
        // 配列をアプリ内へ保存する
        
        
        
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
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
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
