//
//  GameScene.swift
//  MyScore
//
//  Created by Powen Ko on 2/19/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        // 1. 下方的版權宣告
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.zPosition = 10
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        
        // 2. 左上角的 Score 文字
        let myLabel2 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        myLabel2.zPosition = 10
        myLabel2.text = "Your Score"
        myLabel2.fontSize = 50
        myLabel2.fontColor=UIColor(red:255/255,green:200/255,blue: 25/255, alpha: 250/255)
        myLabel2.position = CGPoint(x:140,y: Int(self.size.height)-140);
        self.addChild(myLabel2)
        
        
        // 3. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "game3bg.jpg")
        bgImage.zPosition = -1
        self.addChild(bgImage)
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
		
		// 4. button1 圖片
        let button1 = SKSpriteNode(imageNamed: "button1.png")
        button1.zPosition = 3
        self.addChild(button1)
        button1.position = CGPoint(x:self.frame.midX-70, y:self.frame.midY-220);
        
		
		// 5. button2 圖片
        let button2 = SKSpriteNode(imageNamed: "button2.png")
        button2.zPosition = 3
        self.addChild(button2)
        button2.position = CGPoint(x:self.frame.midX+70, y:self.frame.midY-220);
        
        
        // 6. place 圖片
        let place = SKSpriteNode(imageNamed: "place.png")
        place.zPosition = 3
        self.addChild(place)
        place.position = CGPoint(x:self.frame.midX, y:self.frame.midY+35);
        
        // a. place 動畫（重複放大縮小）
        let actionD1 = SKAction.scale(to: 1.1, duration:5)
        let actionD2 = SKAction.scale(to: 1, duration:5)
        
        let actionD3 = SKAction.sequence([actionD1,actionD2])
        let actionD4 = SKAction.repeatForever(actionD3)
        place.run(actionD3)
        
        
        // 7. cloud 圖片
        let cloud = SKSpriteNode(imageNamed: "cloud.png")
        cloud.zPosition = 1
        self.addChild(cloud)
        cloud.position = CGPoint(x:self.frame.midX, y:self.frame.midY+200);
        
		// b. cloud 動畫（雲朵分別淡入淡出 10 次）
        let actionC1 = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 0) , colorBlendFactor: 1, duration: 2)
        let actionC2 = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 1) , colorBlendFactor: 1, duration: 2)
        
        let actionC3 = SKAction.sequence([actionC1,actionC2])
        let actionC4 = SKAction.repeat(actionC3,count:10)
        cloud.run(actionC4)
        
        
        // 8. score 圖片
        let scorebg = SKSpriteNode(imageNamed: "scorebg.png")
        scorebg.zPosition = 2
        self.addChild(scorebg)
        scorebg.position = CGPoint(x:0, y:self.frame.midY+256);
		
		// c. score 動畫（從左上方移動至上方，且再放大縮小）
        let newPosition2 =  CGPoint(x:self.frame.midX, y:self.frame.midY+256);
        let action1 = SKAction.move(to: newPosition2, duration:1)
        let action2 = SKAction.scale(to: 1.9, duration:1)
        let action3 = SKAction.scale(to: 1, duration:1)
        let scaleSequence = SKAction.sequence([action1,action2,action3])
        scorebg.run(scaleSequence)
        
        
        // 9. bear1 圖片
        let bear1 = SKSpriteNode(imageNamed: "bear1.png")
        bear1.zPosition = 1
        self.addChild(bear1)
        bear1.position = CGPoint(x:self.frame.midX-300, y:self.frame.midY-300);
        
		// d. bear1 動畫（移動並縮放）
        let newPosition =  CGPoint(x:self.frame.midX-320, y:self.frame.midY-200);
        let actionb1 = SKAction.move(to: newPosition, duration:2)
        let actionb2 = SKAction.scale(to: 1.9, duration:2)
        let actionb3 = SKAction.group([actionb1,actionb2])
        bear1.run(actionb3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    }
   
    override func update(_ currentTime: TimeInterval) {
    }
}
