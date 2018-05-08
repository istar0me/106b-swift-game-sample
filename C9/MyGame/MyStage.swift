//
//  GameScene.swift
//  MyStage
//
//  Created by Powen Ko on 2/13/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class MyStage: SKScene {
    var delegate_MyProtocol: MyProtocol?
    var touchedNode  = SKNode()
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    override func didMove(to view: SKView) {
        // 1. 下方的版權宣告
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        // 2. 左上角的 Stage 文字
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
        
        // 4. 透過迴圈放置卡片
        var i:Int=0
        for y1 in stride(from: Int(self.size.height/3), to: Int(self.size.height)-10, by: Int(self.size.height/3)){
            for x1 in stride(from: Int(self.size.width/5), to: Int(self.size.width)-5, by: Int(self.size.width/5)){
                let card1 = SKSpriteNode(imageNamed: "card1.png")
                card1.zPosition = 1
                self.addChild(card1)
                card1.position = CGPoint(x:x1,y:y1)
                card1.name=String(i)
                
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
                    let action1 = SKAction.move(by: CGVector(dx: 0, dy: 100), duration: 2) // 移動位置動畫
                    card1.run(action1, withKey: "action1")
                case 6:
                    card1.color =  SKColor.red;
                    card1.colorBlendFactor = 1;
                    let action1 = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 1) , colorBlendFactor: 1, duration: 2) // 上色動畫
                    card1.run(action1, withKey: "action1")
                case 7:
                    card1.color = UIColor(red: 0, green: 0, blue: 0.5, alpha: 0.5)
                    card1.colorBlendFactor = 1;
                    let action1 = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 1) , colorBlendFactor: 1, duration: 2) // 上色動畫
                    card1.run(action1, withKey: "action1")
                default:
                    card1.zPosition = 1
                }
                i += 1
            }
        }
    }
    
    // 按下去的觸控反應
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            touchedNode=atPoint(location) // 抓取物件
            touchedNode.zPosition = 15 // 改變深度
            let liftUp = SKAction.scale(to: 1.2, duration: 0.2) // 縮放動畫
            touchedNode.run(liftUp, withKey: "pickup")
        }
    }
    
    // 移動的反應
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            touchedNode.position = touch.location(in: self)
            myLabel.text="x=\(location.x),y=\(location.y)"
        }
    }
    
    // 點選放開的觸控反應
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            touchedNode.zPosition = 0 // 改變深度
            let dropDown = SKAction.scale(to: 1.0, duration: 0.2) // 縮放動畫
            touchedNode.run(dropDown, withKey: "drop")
            let nodes: NSArray = self.nodes(at: location) as NSArray // 抓取位置上所有的物件
            
            for node: AnyObject in nodes as [AnyObject]{
                var node1: SKNode=node as! SKNode
                if node1.name==nil {
                }else{
                    var myString:String = node1.name!
                    let idx2 = myString.index(of: "0")

					/* 根據數字跳轉到指定場景 */
                    if let idx = myString.index(of: "0"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "1"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "2"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "3"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "4"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "5"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "6"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "7"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }else if let idx = myString.index(of: "8"){
                        self.delegate_MyProtocol?.SceneChange("MyWord")
                    }
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
