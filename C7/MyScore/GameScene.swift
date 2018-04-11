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
		
        
        // 7. cloud 圖片
        let cloud = SKSpriteNode(imageNamed: "cloud.png")
        cloud.zPosition = 1
        self.addChild(cloud)
        cloud.position = CGPoint(x:self.frame.midX, y:self.frame.midY+200);
		
        
        // 8. score 圖片
        let scorebg = SKSpriteNode(imageNamed: "scorebg.png")
        scorebg.zPosition = 2
        self.addChild(scorebg)
        scorebg.position = CGPoint(x:self.frame.midX, y:self.frame.midY+256);
		
        
        // 9. bear1 圖片
        let bear1 = SKSpriteNode(imageNamed: "bear1.png")
        bear1.zPosition = 1
        self.addChild(bear1)
        bear1.position =  CGPoint(x:self.frame.midX-320, y:self.frame.midY-200); 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    }
   
    override func update(_ currentTime: TimeInterval) {
    }
}
