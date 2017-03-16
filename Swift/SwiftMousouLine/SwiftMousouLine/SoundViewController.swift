//
//  SoundViewController.swift
//  SwiftMousouLine
//
//  Created by Takanori.H on 2017/03/15.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 最初は非表示
        imageView2.isHidden = true
        
        // ラベルを非表示
        timeLabel.isHidden = true
        
        // 音声(callMusic.mp3)を再生する
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch {
                // プレイヤー作成失敗
                // その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
            
        } else {
            // urlがnilなので再生できない
            fatalError("Url is nil.")
        }

        
        
    }
    
    @IBAction func tap(_ sender: AnyObject) {
        
        // imageView2の非表示を表示に変える
        imageView2.isHidden = false
        
        // timeLabelの非表示を表示状態に変える
        timeLabel.isHidden = false
        
        //　タイマーをstartさせて(timeLabel)へ秒数を表示
        Timer.scheduledTimer(timeInterval: 1.0, target: self,
        selector:#selector(timerCountup) , userInfo: nil, repeats:true)
        
        /** ここにおいてもtextLabelが変わることはない **/
        // timeLabel.text = String(count)
        
        // baby.mp3の音声を再生する
        playBabySound()
        
    }
    
    func playBabySound(){
        
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch {
                // プレイヤー作成失敗
                // その場合は、プレイヤーをnilとする
                audioPlayer = nil
            }
            
        } else {
            // urlがnilなので再生できない
            fatalError("Url is nil.")
        }

        
    }
    
    func timerCountup(){
        
        count = count + 1
        
        timeLabel.text = String(count)
        
    }
    
    
    @IBAction func deny(_ sender: AnyObject) {
        
        // 電話を切る
        
        // 音声(callMusic.mp3)をストップ
        audioPlayer?.stop()
        
        // 画面を戻す
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
