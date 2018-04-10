//
//  GameScene.swift
//  MyStage
//
//  Created by Powen Ko on 2/13/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    @objc let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    override func didMove(to view: SKView) {
        // 1. 設定遊戲的場景
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        // 2. 左上角 Stage 文字
        let myLabel2 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        myLabel2.text = "Stages";
        myLabel2.fontSize = 50;
        myLabel2.fontColor=UIColor(red: 255/255, green: 200/255,blue: 25/255, alpha: 250/255)
        
        myLabel2.position = CGPoint(x:100,y: Int(self.size.height)-140);
        self.addChild(myLabel2)
        
        // 3. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "game2bg.jpg")
        bgImage.zPosition = -1
        self.addChild(bgImage)
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        // 4. 透過迴圈放置關卡圖
        for y1 in stride(from: Int(self.size.height/3), to: Int(self.size.height)-10, by: Int(self.size.height/3)) {
            for x1 in stride(from: Int(self.size.width/5), to: Int(self.size.width)-5, by: Int(self.size.width/5)) {
                let card1 = SKSpriteNode(imageNamed: "card3.png")
                card1.zPosition = 1
                self.addChild(card1)
                card1.position = CGPoint(x:x1,y:y1)
            }
       }
        
    }
	// 點選按下的觸控反應
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
       
                        
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
    }
}
