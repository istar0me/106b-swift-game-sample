//
//  GameScene.swift
//  MyStage
//
//  Created by Powen Ko on 2/13/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    @objc var touchedNode  = SKNode()
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
        var i:Int=0
        for y1 in stride(from: Int(self.size.height/3), to: Int(self.size.height)-10, by: Int(self.size.height/3)) {
            for x1 in stride(from: Int(self.size.width/5), to: Int(self.size.width)-5, by: Int(self.size.width/5)) {
                let card1 = SKSpriteNode(imageNamed: "card1.png")
                card1.zPosition = 1
                self.addChild(card1)
                card1.position = CGPoint(x:x1,y:y1)
                switch i{
                case 0:
                    card1.zPosition = 0 // 深度
                case 1:
                    card1.alpha = 0.5 // 透明度
                case 2:
                    card1.xScale = 0.5 // 寬度
                case 3:
                    card1.yScale = 0.5 // 高度
                case 4:
                    card1.zRotation = 0.5 // 旋轉
                case 5:
                 //   card1.physicsBody = SKPhysicsBody(circleOfRadius: card1.size.height / 2.75)
                    
                    card1.zPosition = 1 // 深度
                case 6:
                    card1.color =  SKColor.red; // 顏色
                    card1.colorBlendFactor = 1;
                case 7:
                    card1.color = UIColor(red: 0, green: 0, blue: 0.5, alpha: 0.5) // 顏色
                    card1.colorBlendFactor = 1;
                default:
                    card1.zPosition = 1 // 深度
                }

                
                switch i{
                case 0:
                    card1.zPosition = 0
                case 1:
                    card1.alpha = 0.5
                    let action1 = SKAction.fadeAlpha(to: 1, duration: 2) // 透明度動畫
                    card1.run(action1, withKey: "action1")
                case 2:
                    card1.xScale = 0.5
                    let action1 = SKAction.scaleX(to: 1, duration: 2) // 改變寬度動畫
                    card1.run(action1, withKey: "action1")
                case 3:
                    card1.yScale = 0.5
                    let action1 = SKAction.scaleY(to: 1, duration: 2) // 改變高度動畫
                    card1.run(action1, withKey: "action1")
                case 4:
                    card1.zRotation = 0.5
                    let action1 = SKAction.rotate(toAngle: 0, duration: 2) // 旋轉動畫
                    card1.run(action1, withKey: "action1")
                    
                case 5:
                    card1.position.y=card1.position.y-100
                    let action1 = SKAction.move(by: CGVector(dx: 0, dy: 100), duration: 2) // 位置動畫
                    card1.run(action1, withKey: "action1")
                case 6:
                    card1.color =  SKColor.red;
                    card1.colorBlendFactor = 1;
                    let action1 = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 1) , colorBlendFactor: 1, duration: 2) // 顏色動畫
                    card1.run(action1, withKey: "action1")
                case 7:
                    card1.color = UIColor(red: 0, green: 0, blue: 0.5, alpha: 0.5)
                    card1.colorBlendFactor = 1;
                    let action1 = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 1) , colorBlendFactor: 1, duration: 2) // 顏色動畫
                    card1.run(action1, withKey: "action1")
                default:
                    card1.zPosition = 1
                }

                
                i += 1
            }
       }
    }

    // 點選按下的觸控反應
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
           // var touch: UITouch = touches.allObjects[0] as! UITouch
        let location: CGPoint = touch.location(in: self)
        touchedNode=atPoint(location) // 抓取物件
        touchedNode.zPosition = 15 // 改變深度
        let liftUp = SKAction.scale(to: 1.2, duration: 0.2) // 縮放動畫
        touchedNode.run(liftUp, withKey: "pickup")
        }
    }

    // 移動的反應
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
        let location: CGPoint = touch.location(in: self)
        touchedNode.position = touch.location(in: self)
        myLabel.text="x=\(location.x),y=\(location.y)"
        }
    }
    
    // 點選放開的觸控反應
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
            if let touch = touches.first {
        let location: CGPoint = touch.location(in: self)
        touchedNode.zPosition = 0 // 改變深度
        let dropDown = SKAction.scale(to: 1.0, duration: 0.2) // 縮放動畫
        touchedNode.run(dropDown, withKey: "drop")
        }
    }
    
    
   
    override func update(_ currentTime: TimeInterval) {
    }
}
