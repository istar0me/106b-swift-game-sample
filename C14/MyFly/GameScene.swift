//
//  GameScene.swift
//  MyFly
//
//  Created by Powen Ko on 3/11/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//
import SpriteKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    let myScore = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
    var fly:SKSpriteNode = SKSpriteNode()
    override func didMove(to view: SKView) {
        /* 設定遊戲的場景 */
        // 1. 版權宣告標籤
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        
        // 2. 成績
        myScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // 文字置左
        myScore.text = "30";
        myScore.fontSize = 50;
        myScore.fontColor = UIColor(red: 1/255, green: 1/255,blue: 1/255, alpha: 150/255)
        myScore.position = CGPoint(x:30,y: Int(self.size.height)-160);
        self.addChild(myScore)
        
        
        // 3. 背景（藍天）
        let bgImage = SKSpriteNode(imageNamed: "game5_bg1.jpg")
        bgImage.zPosition = -1
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(bgImage)
        
        
        // 4. 主角
        let fly1 = SKTexture(imageNamed: "fly1.png") // 主角圖片 1
        let fly2 = SKTexture(imageNamed: "fly2.png") // 主角圖片 2
        let ani1 = SKAction.animate(with: [fly1,fly2], timePerFrame:0.25) // 0.25 秒切換圖片
        let ani2 = SKAction.repeatForever(ani1) // 重複切換圖片
        fly = SKSpriteNode(texture: fly1) //
        fly.run(ani2) // 執行動畫
        fly.zPosition = 2 // 設定高度
        fly.position = CGPoint(x:self.frame.midX, y:self.frame.midY); // 設定位置
        self.addChild(fly)
        
        // 物理效果
        fly.physicsBody = SKPhysicsBody(rectangleOf: fly.size) // 設定物理大小為實際圖片的大小
        fly.physicsBody?.isDynamic = true // 設定動態物理計算，代表此物件會受到物理反應改變為自動改變位置（在此為往下掉）
        fly.physicsBody?.allowsRotation = false // 執行物理反應時，是否會旋轉（在此設定否）
        self.physicsWorld.gravity = CGVector(dx: 0.0,dy: -5.0) // 地心引力的強度（在此為向下 5）
        self.physicsWorld.contactDelegate = self // 物理反應的觸發類別，在此為自己（GameScene 類別）
    }
    
    // 點擊後向上跳躍
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.fly.physicsBody?.velocity=CGVector(dx: 0,dy: 0) // 設定物件的重力加速度，在此為 0
        self.fly.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 200)) // 向上推動 200
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
