//
//  GameScene.swift
//  MyGame
//
//  Created by Powen Ko on 2/11/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var button1 = SKSpriteNode(imageNamed: "button1.png")
    var button2 = SKSpriteNode(imageNamed: "button1.png")
    
    override func didMove(to view: SKView) {
        /* 設定遊戲的場景 */
        // 1. 版權宣告標籤
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.zPosition = 3
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        // 2. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "bg.jpg")
        self.addChild(bgImage)
        bgImage.zPosition = -1 // 把背景圖放後面
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        // 3. 選單按鈕
        // let button1 = SKSpriteNode(imageNamed: "button1.png")
        self.addChild(button1)
        button1.zPosition = 1
        button1.position = CGPoint(x: 300,y:200 );
        
        let myLabel1 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel1.text = "About Us"
        myLabel1.fontSize = 28
        myLabel1.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel1.zPosition = 2
        myLabel1.position = CGPoint(x: 300,y:200-12 );
        self.addChild(myLabel1)
        
        // let button2 = SKSpriteNode(imageNamed: "button1.png")
        self.addChild(button2)
        button2.zPosition = 1
        button2.position = CGPoint(x: 300,y:300 );
        
        let myLabel2 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel2.text = "Start"
        myLabel2.fontSize = 28
        myLabel2.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel2.zPosition = 2
        myLabel2.position = CGPoint(x: 300,y:300-12 )
        self.addChild(myLabel2)
        
        // 4. 煙花效果圖
        let effect = SKSpriteNode(imageNamed: "effect.png")
        self.addChild(effect)
        effect.zPosition = 0
        effect.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        
        // 5. 主角圖片
        let act1 = SKSpriteNode(imageNamed: "act1.png")
        self.addChild(act1)
        act1.zPosition = 3
        act1.position = CGPoint(x:self.frame.midX+250, y:self.frame.midY-150)
        
    }
    /* 點下去的觸發事件 */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // var touch: UITouch = touches.allObjects[0] as! UITouch
        // let touch: UITouch = touches.first!
        if let touch = touches.first {
            
            let location: CGPoint = touch.location(in: self)
            
            if button2.contains(location) {
                button2.texture=SKTexture(imageNamed: "button2.png")
            }
            
            if button1.contains(location) {
                button1.texture=SKTexture(imageNamed: "button2.png")
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
