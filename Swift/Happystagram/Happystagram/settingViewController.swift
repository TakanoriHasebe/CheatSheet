//
//  settingViewController.swift
//  Happystagram
//
//  Created by Takanori.H on 2017/06/04.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class settingViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        
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


    @IBAction func changeProfile(_ sender: AnyObject) {
        
        let alertViewController = UIAlertController(title: "選択してください", message: "", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler:{(action:UIAlertAction!)
            -> Void in
            
            // 処理を書く
            self.openCamera()
            
            }
        )
        
        let photosAction = UIAlertAction(title: "アルバム", style: .default, handler:{(action:UIAlertAction!)
            -> Void in
            
            // 処理を書く
            self.openPhoto()
            
            }
        )
        
        let cancelAction = UIAlertAction(title: "キャンセル", style:.cancel, handler: nil)
        
        alertViewController.addAction(cameraAction)
        alertViewController.addAction(photosAction)
        alertViewController.addAction(cancelAction)
        
        self.present(alertViewController, animated: true, completion: nil)

        
    }
    
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
    
    @IBAction func logout(_ sender: AnyObject) {
        
        
        
    }
    
    @IBAction func back(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func done(_ sender: AnyObject) {
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    
    }
    
}
