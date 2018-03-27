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
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        // 2. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "bg.jpg")
        self.addChild(bgImage)
        bgImage.zPosition = -1 // 把背景圖放後面
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        // 3. 選單按鈕
        //let button1 = SKSpriteNode(imageNamed: "button1.png")
        self.addChild(button1)
        button1.position = CGPoint(x: 300,y:200 );
        
        let myLabel1 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel1.text = "About Us"
        myLabel1.fontSize = 28
        myLabel1.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel1.position = CGPoint(x: 300,y:200-12 );
        self.addChild(myLabel1)
        
        //let button2 = SKSpriteNode(imageNamed: "button1.png")
        self.addChild(button2)
        button2.position = CGPoint(x: 300,y:300 );
        
        let myLabel2 = SKLabelNode(fontNamed:"Chalkduster")
        myLabel2.text = "Start"
        myLabel2.fontSize = 28
        myLabel2.fontColor=UIColor(red: 255/255, green: 255, blue: 255/255, alpha: 200/255)
        myLabel2.position = CGPoint(x: 300,y:300-12 )
        self.addChild(myLabel2)
        
    }
    
    /* 手指頭移動的觸發事件 */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    /* 手指頭放開的觸發事件 */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        button1.texture=SKTexture(imageNamed: "button1.png")
        button2.texture=SKTexture(imageNamed: "button1.png")
    }
    
    /* 點下去的觸發事件 */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        let location: CGPoint = touch!.location(in: self) // 取得按下的位置
        if button2.contains(location) { // 判斷是否點擊到按鈕
            button2.texture=SKTexture(imageNamed: "button2.png")
        }
        
        if button1.contains(location) { // 判斷是否點擊到按鈕
            button1.texture=SKTexture(imageNamed: "button2.png")
        }
        
        
        //        let buttonx = SKSpriteNode(imageNamed: "button1.png")
        //        self.addChild(buttonx)
        //        button2.position = location
        
        
        
        /* 原本點擊後會顯示飛機的程式 */
        /*
         for touch: AnyObject in touches {
         let location = touch.locationInNode(self)
         
         let sprite = SKSpriteNode(imageNamed:"Spaceship")
         
         sprite.xScale = 0.5
         sprite.yScale = 0.5
         sprite.position = location
         
         let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
         
         sprite.runAction(SKAction.repeatActionForever(action))
         
         self.addChild(sprite)
         }*/
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
