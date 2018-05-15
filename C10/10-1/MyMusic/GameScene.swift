//
//  GameScene.swift
//  MyMusic
//
//  Created by Powen Ko on 2/25/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//
import UIKit
import SpriteKit
import AVFoundation // 匯入 AVFoundation 框架

class GameScene: SKScene {
    var avPlayer:AVAudioPlayer! = nil // 宣告一個 AVAudioPlayer 類別的變數，並賦值為 nil
    override func didMove(to view: SKView) {
        /* 設定遊戲的場景 */
        // 1. 螢幕中間文字(Hello, Music!)
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, Music!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(myLabel)
        
        // 2. 設定背景的播放
        let fileURL:URL = Bundle.main.url(forResource: "song",withExtension: "mp3")! // 指定播放的檔案
        
        // 錯誤處理
        var error: NSError?
        do {
            self.avPlayer = try AVAudioPlayer(contentsOf: fileURL) // 試著播放音樂，如果有錯會將錯誤訊息丟至 catch 子句
        } catch var error1 as NSError {
            error = error1
            self.avPlayer = nil
        }
        if avPlayer == nil {
            if let e = error {
                print(e.localizedDescription) // 印出錯誤訊息
            }
        }
        avPlayer.numberOfLoops = -1 // 指定播放的次數，負數為重複播放
        avPlayer.play() // 開始播放
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        avPlayer.stop() // 停止播放
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
