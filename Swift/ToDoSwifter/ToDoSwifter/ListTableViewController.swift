//
//  ListTableViewController.swift
//  ToDoSwifter
//
//  Created by Takanori.H on 2017/03/20.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var resultArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // viewDidLoadが呼ばれない可能性があるためここに記述
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // アプリ内にarrayというキー値で保存された配列arrayを取り出す
        
        if UserDefaults.standard.object(forKey: "array") != nil{
            
            // as!はストリングとして配列に入れるということ
            resultArray = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        
        // これを行うことでCellを更新する。
        tableView.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultArray.count // resultArrayの個数と同じ
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = resultArray[indexPath.row]
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    //
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 消去する時になったら何をするのかということを書く
        if editingStyle == .delete {
            
            // 配列のセルのスライドされた番号の消去
            resultArray.remove(at: indexPath.row)
            
            // その配列を再びアプリ内へ保存
            UserDefaults.standard.set(resultArray, forKey: "array")
            
            // TableViewを更新
            tableView.reloadData()
            
        
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


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
