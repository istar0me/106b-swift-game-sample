//
//  GameScene.swift
//  MyGame
//
//  Created by Powen Ko on 2/11/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        /* 設定遊戲的場景 */
        // 1. 版權宣告標籤
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        // 2. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "bg.jpg")
        self.addChild(bgImage)
        bgImage.zPosition = -1 // 把背景圖放後面
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        // 3. 選單按鈕
        //    About Us 按鈕
        let button1 = SKSpriteNode(imageNamed: "button1.png")
        self.addChild(button1)
        button1.position = CGPoint(x: 300,y:200 );
        
        let myLabel1 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel1.text = "About Us"
        myLabel1.fontSize = 28
        myLabel1.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel1.position = CGPoint(x: 300,y:200-12 );
        self.addChild(myLabel1)
        
        //    Start 按鈕
        let button2 = SKSpriteNode(imageNamed: "button1.png")
        self.addChild(button2)
        button2.position = CGPoint(x: 300,y:300 );
        
        let myLabel2 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel2.text = "Start"
        myLabel2.fontSize = 28
        myLabel2.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel2.position = CGPoint(x: 300,y:300-12 )
        self.addChild(myLabel2)
        
    }
    /* 點下去的觸發事件 */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration:1)
            
            sprite.run(SKAction.repeatForever(action))
            
            self.addChild(sprite)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}

