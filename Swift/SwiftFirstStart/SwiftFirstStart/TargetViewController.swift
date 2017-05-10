//
//  TargetViewController.swift
//  SwiftFirstStart
//
//  Created by Takanori.H on 2017/05/10.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit


typealias ExecuteOnce = () -> ()

// 一度だけ引数にしていされたクロージャを実行するクロージャを返す関数
func executeOnce(execute: @escaping () -> ()) -> ExecuteOnce {
    var first = true
    return {
        if (first) {
            first = false
            execute()
        }
    }
}

class TargetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 一度だけ実行したい処理
    var someInitialize: ExecuteOnce = {}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // 処理を定義（selfキャプチャが不要であれば定数プロパティとして宣言可能）
        someInitialize = executeOnce { [unowned self] in
            // 一度だけ実行したい処理
            // print("呼ばれました。")
            // self.performSegue(withIdentifier: "target1", sender: nil)
            let next = self.storyboard!.instantiateViewController(withIdentifier: "next")
            self.present(next,animated: false, completion: nil)

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        someInitialize() // 何度呼びだされても実行されるのは一度だけ
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
