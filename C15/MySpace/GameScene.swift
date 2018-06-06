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
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            let node = atPoint(location)       // 判斷是否點擊到飛碟
            if node.name == "space"{
                let space = node as! SpaceNode // 資料轉換
                space.arrayClear()             // 清除矩陣
                space.arrayAdd(location)       // 把資料放入陣列中
                m_CurrentSpace=space           // 記錄現在的飛碟
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            if let node = m_CurrentSpace {
                node.arrayAdd(location) // 把資料放入陣列中
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        m_CurrentSpace=nil
    }
    
    
    // 畫面更新的觸發事件
    override func update(_ currentTime: TimeInterval) {
        enumerateChildNodes(withName: "space", using: {node, stop in
            let space = node as! SpaceNode // 轉換類別
            space.move(self.timer)         // 呼叫 SpaceNode 的 move 函數
        })
    }
}
