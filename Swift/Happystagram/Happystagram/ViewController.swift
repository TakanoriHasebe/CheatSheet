//
//  ViewController.swift
//  Happystagram
//
//  Created by Takanori.H on 2017/06/02.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // items配列
    var items = [NSDictionary]()
    
    let refreshControll = UIRefreshControl()
    
    @IBOutlet var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "check") == nil{
            
        }else{
            
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "login")
            self.present(loginViewController!, animated: true, completion: nil)
            
        }
        
        tableview.delegate = self
        tableview.dataSource = self
        
        refreshControll.attributedTitle = NSAttributedString(string: "引っ張って更新")
        refreshControll.addTarget(self, action: #selector(refresh), for:UIControlEvents.valueChanged)
        tableview.addSubview(refreshControll)
        
        /*
        refreshControl.attributedTitle = NSAttributedString(string: "引っ張って更新")
        refreshControl.addTarget(self, action:#selector(refresh), for:UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)*/
        
    }
    
    func refresh(){
        
        // データを読んでくる
        // tableViewのReload
        
        
    }
    
    // TableViewのデリゲートメソッド
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        // これを記入することでデータベースからとってくる *
        let dict = items[(indexPath as NSIndexPath).row]
        
        // profile *
        let profileImageView = cell.viewWithTag(1) as! UIImageView
        // デコードしたDataをUIImage型へ変換してimageViewへ反映する *
        let decodeData = (base64Encoded: dict["profileImage"])
        let decodedData = NSData(base64Encoded:decodeData as! String, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        let decodedImage = UIImage(data: decodedData! as Data)
        /* 以下の8.0の値が大きければ大きいほど○に近づいていく */
        profileImageView.layer.cornerRadius = 8.0
        profileImageView.clipsToBounds = true
        
        profileImageView.image = decodedImage
        
        // ユーザー名 *
        let userNameLabel = cell.viewWithTag(2) as! UILabel
        // 以下のコードで辞書でusernameを取ってきたものを、userNameLabelに反映するということ
        userNameLabel.text = dict["username"] as? String
        
        // 投稿画像 *
        let postedImageView = cell.viewWithTag(3) as! UIImageView
        // デコードしたDataをUIImage型へ変換してimageViewへ反映する *
        let decodeData2 = (base64Encoded: dict["profileImage"])
        let decodedData2 = NSData(base64Encoded:decodeData2 as! String, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        let decodedImage2 = UIImage(data: decodedData2! as Data)
        postedImageView.image = decodedImage2

        
        // コメント
        let commentTextView = cell.viewWithTag(4) as! UITextView
        commentTextView.text = dict["comment"] as? String
        
        return cell
    }
    
    // データベースからデータを取ってきて、配列の中に入れた *
    func loadAllData()
    {
        
        // https://happystagram-91cb5.firebaseio.com/
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // どこのURLから参照するのかという設定を行う
        let firebase = Database.database().reference(fromURL: "https://happystagram-91cb5.firebaseio.com/").child("Posts")
        
        // 更新されたものの最新の何個を取ってくるかということ
        firebase.queryLimited(toLast: 10).observe(.value) { (snapshot,error) in
            var tempItems = [NSDictionary]()
            for item in(snapshot.children){
                
                let child = item as! DataSnapshot
                let dict =  child.value
                tempItems.append(dict as! NSDictionary)
                
                
            }
            
            // このitemsに入る
            self.items = tempItems
            self.items = self.items.reversed()
            self.tableview.reloadData()
            
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func openCamera(){
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    func openPhoto(){
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func showCamera(_ sender: AnyObject) {
        
        openCamera()
        
    }
    
    @IBAction func showPhotos(_ sender: AnyObject) {
        
        openPhoto()
        
    }
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            // backImageViewというものをはじめにつくっておいて、そのimageに
            // 撮影された画像(アルバムで選択された画像)が、デリゲートメソッドが呼ばれたときに
            // UserPhotoボタンがタップされた時、
            // 入っているpickedImageを代入する
            // backImageView.image = pickedImage
        
            
        }
        
        //カメラ画面(アルバム画面)を閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

