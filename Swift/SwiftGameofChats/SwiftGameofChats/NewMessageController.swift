//
//  NewMessageController.swift
//  SwiftGameofChats
//
//  Created by Takanori.H on 2017/06/15.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {

    let cellId = "cellId"
    
    /* ユーザー情報を保存する配列 */
    var users = [Users]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 左上にtitleを配置 */
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        fetchUser()
    }
    
    /* コピペ */
    /* Userの情報を取得 */
    func fetchUser(){
        /* コピペ */
        /* Firebaseから全てのユーザー情報を取得 */
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                
                /* Firebaseから取得したユーザー */
                /* if you use this setter, your app will clash if your class properties don't exactly match up with the firebase dictionary keys */
                let user = Users()
                user.setValuesForKeys(dictionary)
                self.users.append(user)
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                
                /* ユーザーの名前とユーザーのemailを表示 */
                // user.name = dictionary["name"] as! String
                // print(user.name, user.email)
            }
            
            /* 取得した全てのユーザーを表示する */
            // print("User Found")
            // print(snapshot)
            
        }, withCancel: nil)
        
    }
    
    
    func handleCancel(){
        
        /* ひとつ前のViewに戻る */
        dismiss(animated: true, completion: nil)
    }
    
    /* 表示するテキストの個数 */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    /* tableViewにテキストを表示 */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let use a hack for now, we actually need to dequeue our cells for memory efficiency
        // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        /* 下のcodeでtableViewにユーザー名, emailを表示 */
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
}

class UserCell: UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








