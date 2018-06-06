//
//  GameScene.swift
//  MySpace
//
//  Created by Powen Ko on 3/12/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var m_CurrentSpace:SpaceNode?
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    let myScore = SKLabelNode(fontNamed:"Chalkduster")
    var fly:SKSpriteNode = SKSpriteNode()
    var timer: TimeInterval = 0.0
    var lastUpdateTime: TimeInterval = 0.0 // 紀錄上次的時間
    override func didMove(to view: SKView) {
        // 1.Game Over 標籤
        myLabel.text = "";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(myLabel)
        
        
        // 2.分數標籤
        myScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        myScore.text = "30";
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
        
        FunSet_space()
    }
    
    
    // 顯示飛碟
    func FunSet_space(){
        let space = SpaceNode(imageNamed:"space1.png")
        space.position = CGPoint(x: 20, y: Int(arc4random_uniform(300)))
        space.name = "space"
        self.addChild(space)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location: CGPoint = touches.first!.location(in: self)
        let node = atPoint(location)
        if node.name == "space"{
            let space = node as! SpaceNode
            space.arrayClear()
            space.arrayAdd(location)
            m_CurrentSpace=space
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location: CGPoint = touches.first!.location(in: self)
        if let node = m_CurrentSpace {
            node.arrayAdd(location)
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        m_CurrentSpace=nil
    }
    
    
    // 畫面更新的觸發事件
    override func update(_ currentTime: TimeInterval) {
        self.timer=currentTime - self.lastUpdateTime // 計算時間差
        self.lastUpdateTime = currentTime // 儲存顯示的時間
        enumerateChildNodes(withName: "space", using: {node, stop in
            let space = node as! SpaceNode // 轉換類別
            space.move(self.timer)         // 將時間差帶入函數
        })
        funLine()
    }
    
    
    // 畫線
    func funLine(){
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
}
