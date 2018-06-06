//
//  GameScene.swift
//  MySpace
//
//  Created by Powen Ko on 3/12/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var m_CurrentSpace:SpaceNode?
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    let myScore = SKLabelNode(fontNamed:"Chalkduster")
    var Score:Int=0
    var fly:SKSpriteNode = SKSpriteNode()
    var timer: TimeInterval = 0.0
    var lastUpdateTime: TimeInterval = 0.0 // 紀錄上次的時間
    var gameStatus=0 // 0 = 繼續執行；1 = 遊戲結束
    let SpaceCat:UInt32 = 1 << 0 // 設定飛碟為 1
    let ParkingCat:UInt32 = 1 << 1 // 設定停機坪為 2
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0) // 設定地心引力為 0 （即沒有地心引力）
        physicsWorld.contactDelegate = self // 物理碰撞反應
        // 1.Game Over 標籤
        myLabel.text = "";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(myLabel)
        
        
        // 2.分數標籤
        myScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        myScore.text = "\(self.Score)"; // 顯示實際的分數
        myScore.fontSize = 50;
        myScore.fontColor=UIColor(red: 1/255, green: 1/255,blue: 1/255, alpha: 150/255)
        myScore.position = CGPoint(x:30,y: Int(self.size.height)-160);
        self.addChild(myScore)
        
        
        // 3.背景
        let bg = SKSpriteNode(imageNamed: "game7_bg.jpg")
        bg.zPosition = -1
        bg.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(bg)
        
        
        // 4.停機坪
        let parking = SKSpriteNode(imageNamed: "parking.png")
        parking.zPosition = 0
        parking.position = CGPoint(x:self.frame.width-parking.size.width, y:100.0);
        self.addChild(parking)
        parking.physicsBody = SKPhysicsBody(circleOfRadius: parking.size.width / 2.0) // 碰撞大小
        parking.physicsBody!.categoryBitMask = ParkingCat // 設定物件的碰撞遮罩（停機坪）
        parking.physicsBody!.contactTestBitMask = SpaceCat // 指定會發生碰撞的物件（飛碟）
        parking.physicsBody!.collisionBitMask = 0
        
        FunSet_space()
    }
    
    
    // 顯示飛碟
    func FunSet_space(){
        if (gameStatus==0) { // 加上遊戲狀態判斷
            let space = SpaceNode(imageNamed:"space1.png")
            space.position = CGPoint(x: 30, y: Int(arc4random_uniform(300))+30)
            space.name = "space"
            self.addChild(space)
            space.physicsBody = SKPhysicsBody(circleOfRadius: space.size.width / 2.0) // 碰撞大小
            space.physicsBody!.categoryBitMask = SpaceCat // 設定物件的碰撞遮罩（飛碟）
            space.physicsBody!.contactTestBitMask = SpaceCat |  ParkingCat // 指定會發生碰撞的物件（飛碟或停機坪）
            space.physicsBody!.collisionBitMask = 0
            
            space.initFly() // 呼叫自動移動的函數
            let ani1=SKAction.run({self.FunSet_space()}) // 呼叫產生飛碟的函數
            let ani2=SKAction.sequence([SKAction.wait(forDuration: 10), ani1]) // 每 10 秒產生連續的動作
            run(ani2)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (gameStatus==0) { // 加上遊戲狀態判斷
            let location: CGPoint = touches.first!.location(in: self)
            let node = atPoint(location)
            if node.name == "space"{
                let space = node as! SpaceNode
                space.arrayClear()
                space.arrayAdd(location)
                m_CurrentSpace=space
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (gameStatus==0) { // 加上遊戲狀態判斷
            let location: CGPoint = touches.first!.location(in: self)
            if let node = m_CurrentSpace {
                node.arrayAdd(location)
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        m_CurrentSpace=nil
    }
    
    
    // 畫面更新的觸發事件
    override func update(_ currentTime: TimeInterval) {
        if (gameStatus==0) { // 加上遊戲狀態判斷
            self.timer=currentTime - self.lastUpdateTime // 計算時間差
            self.lastUpdateTime = currentTime // 儲存顯示的時間
            enumerateChildNodes(withName: "space", using: {node, stop in
                let space = node as! SpaceNode // 轉換類別
                space.move(self.timer)         // 將時間差帶入函數
            })
            funLine()
        }
    }
    
    
    // 畫線
    func funLine(){
        // 移除舊的線
        enumerateChildNodes(withName: "line", using: {node, stop in
            node.removeFromParent()
        })
        
        // 繪製新的線
        enumerateChildNodes(withName: "space", using: {node, stop in
            let space = node as! SpaceNode      // 轉換類別
            let shapeNode = SKShapeNode()
            shapeNode.path = space.GetPath()    // 呼叫 SKShapeNode 中的 GetPath 函數，取得玩家所畫的線的位置
            shapeNode.name = "line"             // 將這條線取名為 line
            shapeNode.strokeColor = UIColor.red // 設定為紅線
            shapeNode.lineWidth = 2             // 設定線的粗細
            shapeNode.zPosition = 10
            self.addChild(shapeNode)
        })
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let con1=contact.bodyA.node
        let con2=contact.bodyB.node
        let collision = con1!.physicsBody!.categoryBitMask | con2!.physicsBody!.categoryBitMask;
        if collision == SpaceCat { // 是否為飛碟互撞
            print("space crash")
            myLabel.text="Game Over" // 顯示 Game Over
            gameStatus = 1 // 改變遊戲狀態
        } else if collision == SpaceCat | ParkingCat { // 是否為飛碟與停機坪互相碰撞（飛碟抵達停機坪）
            self.Score=self.Score+1 // 加分
            myScore.text = "\(self.Score)"; // 改變分數
            if(con1!.physicsBody!.categoryBitMask==SpaceCat){
                con1?.removeFromParent()
            }
            if(con2!.physicsBody!.categoryBitMask==SpaceCat){
                con2?.removeFromParent()
            }
        }
    }
}
