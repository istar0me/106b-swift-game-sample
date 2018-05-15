//
//  GameScene.swift
//  MyGame
//
//  Created by Powen Ko on 2/11/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//
import SpriteKit
class GameScene: SKScene {
    var delegate_MyProtocol: MyProtocol?
    var button1 = SKSpriteNode(imageNamed: "button1.png")
    var button2 = SKSpriteNode(imageNamed: "button1.png")
    override func didMove(to view: SKView) {
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
