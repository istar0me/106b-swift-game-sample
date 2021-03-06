//
//  GameScene.swift
//  MyFly
//
//  Created by Powen Ko on 3/11/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//
import SpriteKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    let myScore = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
    var fly:SKSpriteNode = SKSpriteNode()
    var gound:SKSpriteNode = SKSpriteNode()
    var bg1:SKSpriteNode = SKSpriteNode()
    var bg2:SKSpriteNode = SKSpriteNode()
    var move:Bool=true
    
    // 指定物件的種類
    let flyCat:UInt32 = 1 << 0      //1 設定為主角的種類
    let pipeCat:UInt32 = 1 << 1     //2 設定為水管的種類
    let levelCat:UInt32 = 1 << 2    //4 設定為地板的種類
    let scoreCat:UInt32 = 1 << 3    //8 設定為成績的種類
    
    override func didMove(to view: SKView) {
        /* 設定遊戲的場景 */
        // 1. 版權宣告標籤
        myLabel.text = "";
        myLabel.zPosition=10
        myLabel.fontSize = 64;
        myLabel.position = CGPoint(x:self.frame.midX,y: self.frame.midY);
        self.addChild(myLabel)
        
        
        // 2. 成績
        myScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left // 文字置左
        myScore.text = "30";
        myScore.fontSize = 50;
        myScore.fontColor = UIColor(red: 1/255, green: 1/255,blue: 1/255, alpha: 150/255)
        myScore.position = CGPoint(x:30,y: Int(self.size.height)-160);
        self.addChild(myScore)
        
        
        // 3.背景（藍天、綠洲）
        FunSet_BKGound("game5_bg2.png",position: 0,speed:20) // 沙洲移動
        FunSet_BKGound("game5_bg1.jpg",position: -1.0,speed:30) // 雲朵移動
        FunSet_Fly()
        FunSet_Gound()
        self.physicsWorld.gravity = CGVector(dx: 0.0,dy: -5.0) // 地心引力的強度（在此為向下 5）
        self.physicsWorld.contactDelegate = self // 物理反應的觸發類別，在此為自己（GameScene 類別）
        
        
        // 4. 水管
        for i in stride(from: 0, to: 100, by: 1) {
            let opensize:CGFloat = CGFloat(arc4random_uniform(UInt32(200+1)))+50
            let t_positionx:CGFloat = CGFloat(i*400)+CGFloat( arc4random_uniform(UInt32(300+1))+100)
            FunSet_Pipe(3.0,speed:60,open: opensize,positionx:t_positionx)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func FunSet_Fly(){
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
        fly.physicsBody?.categoryBitMask = flyCat // 設定物件的種類為 flyCat
        fly.physicsBody?.collisionBitMask = levelCat | pipeCat // 設定物件會被碰撞的種類有 levelCat 和 PipeCat
        fly.physicsBody?.contactTestBitMask = levelCat | pipeCat // 指定不會被穿透的物件
    }
    
    // 設定地板與碰撞效果
    func FunSet_Gound(){
        let speed = 10.0
        /* 沙灘A */
        let gound1 = SKTexture(imageNamed: "game5_bg3.png") // 地板圖片
        gound = SKSpriteNode(texture: gound1) //
        gound.zPosition = 2 // 設定高度
        gound.position = CGPoint(x:self.frame.midX, y:gound.size.height); // 設定位置
        self.addChild(gound)
        
        // 沙灘A物理效果
        gound.physicsBody = SKPhysicsBody(rectangleOf: gound.size) // 設定物理大小為實際圖片的大小
        gound.physicsBody?.isDynamic = false // 設定動態物理計算，代表此物件會受到物理反應改變為自動改變位置（在此不設定）
        gound.physicsBody?.categoryBitMask = levelCat // 設定物件的種類為 levelCat
        
        // 沙灘A移動動畫
        let ani1 = SKAction.move(to: CGPoint(x: -gound.size.width/2, y: gound.size.height), duration: speed)
        let ani2 = SKAction.move(to: gound.position, duration: 0)
        let ani3 = SKAction.sequence([ani1,ani2])
        let ani4 = SKAction.repeatForever(ani3)
        gound.run(ani4)
        
        /* 沙灘B */
        let gound2 = SKSpriteNode(texture: gound1) //
        gound2.zPosition = 2 // 設定高度
        gound2.position = CGPoint(x:self.frame.midX+gound2.size.width , y:gound2.size.height); // 設定位置
        self.addChild(gound2)
        
        // 沙灘B物理效果
        gound2.physicsBody=SKPhysicsBody(rectangleOf: gound2.size) // 設定物理大小為實際圖片的大小
        gound2.physicsBody?.isDynamic=false // 設定動態物理計算，代表此物件會受到物理反應改變為自動改變位置（在此不設定）
        gound2.physicsBody?.categoryBitMask = levelCat // 設定物件的種類為 levelCat
        
        // 沙灘B移動動畫
        let ani1b = SKAction.move(to: CGPoint(x: self.frame.midX, y: gound2.size.height), duration: speed)
        let ani2b = SKAction.move(to: gound2.position, duration: 0)
        let ani3b = SKAction.sequence([ani1b,ani2b])
        let ani4b=SKAction.repeatForever(ani3b)
        gound2.run(ani4b)
    }
    
    // 設定雲和沙洲移動的函數
    func FunSet_BKGound(_ filename:String,position:CGFloat,speed:TimeInterval){
        let gound1 = SKTexture(imageNamed:filename) // 指定圖片
        /* 雲朵/沙洲A */
        bg1 = SKSpriteNode(texture: gound1) //
        bg1.zPosition = position // 指定高度
        bg1.position = CGPoint(x:self.frame.midX, y:self.frame.midY); // 指定位置
        self.addChild(bg1)
        
        // 雲朵/沙洲A移動動畫
        let ani1 = SKAction.move(to: CGPoint(x: -bg1.size.width/2, y: self.frame.midY  ), duration: speed)
        let ani2 = SKAction.move(to: bg1.position, duration: 0)
        let ani3 = SKAction.sequence([ani1,ani2])
        let ani4=SKAction.repeatForever(ani3)
        bg1.run(ani4)
        
        /* 雲朵/沙洲B */
        bg2 = SKSpriteNode(texture: gound1) //
        bg2.zPosition = position // 指定高度
        bg2.position = CGPoint(x:self.frame.midX+bg2.size.width , y:self.frame.midY ); // 指定位置
        self.addChild(bg2)
        
        // 雲朵/沙洲B移動動畫
        let ani1b = SKAction.move(to: CGPoint(x: self.frame.midX, y: self.frame.midY ), duration: speed)
        let ani2b = SKAction.move(to: bg2.position, duration: 0)
        let ani3b = SKAction.sequence([ani1b,ani2b])
        let ani4b=SKAction.repeatForever(ani3b)
        bg2.run(ani4b)
    }
    
    // 處理水管的函數
    func FunSet_Pipe(_ position:CGFloat, speed:TimeInterval, open:CGFloat, positionx:CGFloat) {
        /* 下方水管 */
        let pipe2 = SKSpriteNode(imageNamed: "pipe2.png") // 下方水管圖片
        pipe2.zPosition = 2 // 指定高度
        pipe2.position = CGPoint(x:self.frame.midX+positionx, y:self.frame.midY-(pipe2.size.height/2)-open ); // 指定位置
        self.addChild(pipe2)
        
        // 物理效果
        pipe2.physicsBody=SKPhysicsBody(rectangleOf: pipe2.size) // 設定物理大小為實際圖片的大小
        pipe2.physicsBody?.isDynamic=false // 設定動態物理計算，代表此物件會受到物理反應改變為自動改變位置（在此不設定）
        pipe2.physicsBody?.categoryBitMask = pipeCat // 設定物件的種類為 pipeCat
        
        /* 上方水管 */
        let pipe1 = SKSpriteNode(imageNamed: "pipe1.png") // 上方水管圖片
        pipe1.zPosition = 2 // 指定高度
        pipe1.position = CGPoint(x:self.frame.midX+positionx, y:self.frame.midY+(pipe1.size.height/2)+open ); // 指定位置
        self.addChild(pipe1)
        
        // 物理效果
        pipe1.physicsBody=SKPhysicsBody(rectangleOf: pipe1.size) // 設定物理大小為實際圖片的大小
        pipe1.physicsBody?.isDynamic=false // 設定動態物理計算，代表此物件會受到物理反應改變為自動改變位置（在此不設定）
        pipe1.physicsBody?.categoryBitMask = pipeCat // 設定物件的種類為 pipeCat
        
        // 動畫效果
        let ani1b = SKAction.moveBy(x: -1, y:0, duration:1/speed)
        let ani3b = SKAction.repeatForever(ani1b)
        pipe1.run(ani3b)
        pipe2.run(ani3b)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(move==true){
            self.fly.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            self.fly.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact){
        self.backgroundColor =  SKColor.red
        myLabel.text = "Game Over";
        bg1.isHidden=true
        bg2.isHidden=true
        self.backgroundColor=SKColor.red
        move=false
    }
    
    func didEnd(_ contact: SKPhysicsContact){
    }
}
