//
//  LoginController+handlers.swift
//  SwiftGameofChats
//
//  Created by Takanori.H on 2017/06/16.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import Foundation
import UIKit
import Firebase

/* 下記でLoginController.swiftと同じところに書いているのと同じ */
extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /* Firebase */
    /* Registerに成功した場合、FirebaseのDatabaseに対して、保存する情報を指定して情報を保存 ② */
    /* コピペ */
    func handleRegister(){
        
        /* ここに、これより下のコードで用いる変数を記述 */
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else{
            print("Form is not valid")
            return
        }
        
        /* FirebaseのDatabase接続がエラーの場合 */
        Auth.auth().createUser(withEmail: email, password: password, completion: {(user: User?, error) in
            
            if error != nil{
                print(error)
                return
            }
            
            guard let uid = user?.uid else{
                return
            }
            
            let storageRef = Storage.storage().reference().child("myImage.png")
            if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!){
                
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil{
                        print(error)
                        return
                    }
                    
                    print(metadata)
                    
                })
                
            }
            
            
            /* ログインに成功した場合、FirebaseのDatabaseに対して情報を保存 ② */
            /* コピペ */
            let ref = Database.database().reference(fromURL: "https://gameofchats-99ef0.firebaseio.com/")
            let userReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email, "profileImageUrl": metadata.downloadURL()]
            userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil{
                    print(err)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
                
                print("FirebaseのDatabaseへユーザー情報の登録に成功しました")
                
            })
            
            
        })
    }
    
    private func registerUserIntoDatabase(){
        
    }

    
    func handleSelectProfileImageView(){
        
        /* Userの写真にアクセス */
        /* info.plistのNSPhotoLibraryUsageDescriptionに記述を必ず追加  */
        let picker = UIImagePickerController()
        
        picker.delegate = self
        /* 画像を編集することができる */
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    /* プロフィールの画像を変更する関数 */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        /* 編集した画像 */
        if let editedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        }else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{ /* オリジナルの画像 */
            selectedImageFromPicker = originalImage
        }
        
        /* 画像の配置 */
        if let selectedImage = selectedImageFromPicker{
            profileImageView.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
        
        /* 選択した写真の画像の情報を表示 */
        // print(info)
    }
    
    /* 写真のライブラリが表示されて、Cancelボタンが押された時に前の画面に戻る */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
}


