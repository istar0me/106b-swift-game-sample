//
//  GameScene.swift
//  MyGame
//
//  Created by Powen Ko on 2/11/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//
import SpriteKit
import AVFoundation // 匯入 AVFoundation 框架
class GameScene: SKScene {
    var delegate_MyProtocol: MyProtocol?
    var button1 = SKSpriteNode(imageNamed: "button1.png")
    var button2 = SKSpriteNode(imageNamed: "button1.png")
    
    // 宣告 AVAudioPlayer 類別的變數
    var avPlayer:AVAudioPlayer! = nil
    var avPlayer2:AVAudioPlayer! = nil
    var avPlayer3:AVAudioPlayer! = nil
    
    override func didMove(to view: SKView) {
        /* 讀取和設定音樂 */
        // 1. 背景音樂
        let fileURL:URL = Bundle.main.url(forResource: "song",withExtension: "mp3")! // 指定播放的檔案
        
        // 錯誤處理
        var error: NSError?
        do {
            self.avPlayer = try AVAudioPlayer(contentsOf: fileURL)
        } catch var error1 as NSError {
            error = error1
            self.avPlayer = nil
        }
        if self.avPlayer == nil {
            if let e = error {
                print(e.localizedDescription)
            }
        }
        self.avPlayer.volume = 0.3 // 設定音量
        self.avPlayer.numberOfLoops = -1 // 設定播放的次數，負數為重複播放
        self.avPlayer.play() // 開始播放
        
        
        // 2. beep 音效
        let fileURL2:URL = Bundle.main.url(forResource: "beep",withExtension: "mp3")! // 指定播放的檔案
        
        // 錯誤處理
        var error2: NSError?
        do {
            self.avPlayer2 = try AVAudioPlayer(contentsOf: fileURL2)
        } catch var error as NSError {
            error2 = error
            self.avPlayer2 = nil
        }
        if self.avPlayer2 == nil {
            if let e = error {
                print(e.localizedDescription)
            }
        }
        
        
        // 3. click 音效
        let fileURL3:URL = Bundle.main.url(forResource: "click",withExtension: "mp3")! // 指定播放的檔案
        var error3: NSError?
        do {
            self.avPlayer3 = try AVAudioPlayer(contentsOf: fileURL3)
        } catch var error as NSError {
            error3 = error
            self.avPlayer3 = nil
        }
        if self.avPlayer3 == nil {
            if let e = error {
                print(e.localizedDescription)
            }
        }
        
        /* 設定遊戲的場景 */
        // 1. 版權宣告標籤
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        myLabel.zPosition = 3
        
        // 2. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "bg.jpg")
        self.addChild(bgImage)
        bgImage.zPosition = -1
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        // 3. 選單按鈕
        self.addChild(button1)
        button1.position = CGPoint(x: 300,y:200 );
        button1.zPosition = 1
        let myLabel2 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel2.text = "About Us"
        myLabel2.fontSize = 28
        myLabel2.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel2.position = CGPoint(x: 300,y:200-12 );
        myLabel2.zPosition = 1
        self.addChild(myLabel2)
        
        self.addChild(button2)
        button2.position = CGPoint(x: 300,y:300 );
        button2.zPosition = 1
        let myLabel3 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel3.text = "Start"
        myLabel3.fontSize = 28
        myLabel3.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel3.position = CGPoint(x: 300,y:300-12 )
        myLabel3.zPosition = 1
        self.addChild(myLabel3)
        
        // 4. 煙花效果圖
        let effect = SKSpriteNode(imageNamed: "effect.png")
        self.addChild(effect)
        effect.zPosition = 0
        effect.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        // 5. 主角圖片
        let act1 = SKSpriteNode(imageNamed: "act1.png")
        self.addChild(act1)
        act1.zPosition = 2
        act1.position = CGPoint(x:self.frame.midX+250, y:self.frame.midY-150)
    }
    
    // 按下去的觸控反應
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            // 點擊 Start 按鈕播放 beep.mp3
            if button2.contains(location) {
                button2.texture=SKTexture(imageNamed: "button2.png")
                self.avPlayer2.play()
            }
            
            // 點擊 About Us 按鈕播放 click.mp3
            if button1.contains(location) {
                button1.texture=SKTexture(imageNamed: "button2.png")
                self.avPlayer3.play()
            }
        }
    }
    
    // 移動的反應
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    // 點選放開的觸控反應
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        button1.texture=SKTexture(imageNamed: "button1.png")
        button2.texture=SKTexture(imageNamed: "button1.png")
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self) // 取得按鍵位置
            if button2.contains(location) {
                self.delegate_MyProtocol?.SceneChange("MyStage") // 實際切換場景的動作
            }
            
            if button1.contains(location) {
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
