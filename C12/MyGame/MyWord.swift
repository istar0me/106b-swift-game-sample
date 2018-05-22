//
//  GameScene.swift
//  MyWord
//
//  Created by Powen Ko on 2/20/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class MyWord: SKScene {
    var delegate_MyProtocol: MyProtocol?
    var touchedNodePosition=CGPoint(x: 0, y: 0)
    
    var m_arrayWords = ["APPLE","BANANA","CANDY","ORANGE"]
    var m_arrayTarget:[String] = []
    var m_array:[String] = []
    var m_score=0
    
    let myLabel3 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
    var counter = 0
    var touchedNode  = SKNode()
    var timer = Timer()
    override func didMove(to view: SKView) {
        // 1. 下方的版權宣告
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "copyright 2015 PowenKo.com, All Rights Reserved.";
        myLabel.fontSize = 32;
        myLabel.position = CGPoint(x:self.frame.midX,y: 100);
        self.addChild(myLabel)
        
        
        // 2. 右上角的 MyWord
        let myLabel2 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        myLabel2.text = "MyWord";
        myLabel2.fontSize = 50;
        myLabel2.fontColor=UIColor(red: 255/255, green: 200/255,blue: 25/255, alpha: 250/255)
        
        myLabel2.position = CGPoint(x:Int(self.size.width)-135,y: Int(self.size.height)-165);
        self.addChild(myLabel2)
        
        
        // 3. 左上角的時間
        myLabel3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        myLabel3.text = "30";
        myLabel3.fontSize = 50;
        myLabel3.fontColor=UIColor(red: 1/255, green: 1/255,blue: 1/255, alpha: 150/255)
        
        myLabel3.position = CGPoint(x:220+30,y: Int(self.size.height)-160);
        self.addChild(myLabel3)
        
        // 設定計時
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(MyWord.updateCounter), userInfo: nil, repeats: true)
        
        
        // 4. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "game4bg.jpg")
        bgImage.zPosition = -1
        self.addChild(bgImage)
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        let index = Int(arc4random_uniform(UInt32(m_arrayWords.count)))
        let string1 = m_arrayWords[index]
        let t_len=string1.count
        m_arrayTarget = []
        m_score=0
        var t_arrayTarget = ""
        for i in 0 ..< t_len {
            m_arrayTarget.append(StringGetSUbstring(string1,start:i,End:i+1))
            t_arrayTarget=t_arrayTarget+" "
        }
        
        showWords(string1)
        showTargetWords(t_arrayTarget)
    }
    
    func StringGetSUbstring(_ myString:String,start:Int,End:Int)-> String{
        let myNewString  = (myString as NSString).substring(with: NSMakeRange(start, End-start))
        return myNewString
    }
    
    @objc func updateCounter() {
        counter += 1
        myLabel3.text=String(counter)
    }
    
    // 設定目標的空格
    func showTargetWords(_ string1: String) {
        let t_len=string1.count
        var tChars = Array(string1)
        for i:Int in 0 ..< t_len {
            let firstChar = tChars[i]
            let x1=100+i*120
            let y1=500
            let Str1:String=String(firstChar)
            showTargetWord(Str1,index:i,x1:x1,y1:y1)
        }
    }
    
    // 顯示文字和方塊
    func showTargetWord(_ string1:String,index:Int,x1:Int,y1:Int ) {
        // 顯示空格圖片
        let button2 = SKSpriteNode(imageNamed: "game4button1.png")
        button2.zPosition = 1
        self.addChild(button2)
        button2.position = CGPoint(x:x1, y:y1);
        button2.name="#"+String(index);
        
        
        // 顯示文字
        let myLabel4 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        
        myLabel4.zPosition=2
        myLabel4.text = string1;
        myLabel4.fontSize = 50;
        myLabel4.fontColor=UIColor(red: 255/255, green: 255/255,blue: 255/255, alpha: 150/255)
        
        button2.addChild(myLabel4)
        myLabel4.position = CGPoint(x:0,y:-18);
    }
    
    func showWords(_ string1: String) {
        let t_len=string1.count
        var tChars = Array(string1)
        for i:Int in 0 ..< t_len {
            var firstChar:Character
            var t_working:Bool = false;
            repeat{
                let index:Int = Int(arc4random_uniform(UInt32(t_len)))
                firstChar = tChars[index]
                if firstChar=="#" {
                }else{
                    tChars[index]="#"
                    t_working=true
                }
            }while t_working==false
            
            let x1=100+i*120
            let y1=200
            let Str1:String=String(firstChar)
            showWord(Str1,x1:x1,y1:y1)
        }
    }
    
    func showWord(_ string1:String,x1:Int,y1:Int ) {
        // 5. 英文字母後的方塊
        let button2 = SKSpriteNode(imageNamed: "game4button2.png")
        button2.zPosition = 3
        self.addChild(button2)
        button2.position = CGPoint(x:x1, y:y1);
        button2.name=string1;
        
        
        // 6. 英文字母
        let myLabel4 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        
        myLabel4.zPosition=4
        myLabel4.text = string1;
        myLabel4.fontSize = 50;
        myLabel4.fontColor=UIColor(red: 255/255, green: 255/255,blue: 255/255, alpha: 150/255)
        
        button2.addChild(myLabel4)
        myLabel4.position = CGPoint(x:0,y:-18);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            let nodes: NSArray = self.nodes(at: location) as NSArray
            for node: AnyObject in nodes as [AnyObject]{
                let node1: SKNode=node as! SKNode
                
                if node1.name==nil {
                } else {
                    touchedNode=node1
                    touchedNodePosition=node1.position
                    touchedNode.zPosition = 15
                    let liftUp = SKAction.scale(to: 1.2, duration: 0.2)
                    touchedNode.run(liftUp, withKey: "pickup")
                    print(touchedNode.name)
                    return;
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            if touchedNode.name==nil {
            } else {
                touchedNode.position = touch.location(in: self)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location: CGPoint = touch.location(in: self)
            let nodes: NSArray = self.nodes(at: location) as NSArray
            var isCorrect:Bool = false
            
            for node: AnyObject in nodes as [AnyObject]{
                let node1: SKNode=node as! SKNode
                if node1.name==nil {
                } else {
                    let myString:String = node1.name!
                    let myfind: Character = "#"
                    if let idx = myString.index(of: myfind){
                        print(myString)
                        let myNewString  = (myString as NSString).substring(with: NSMakeRange(1, myString.count-1 ))
                        print(myNewString);
                        let index:Int = Int(myNewString)!
                        let t2:String = m_arrayTarget[index]
                        print(t2);
                        
                        let t3:String = touchedNode.name!
                        if t2==t3 {
                            Wordadd(t3,buttonx:node1)
                            isCorrect = true
                            let action1 = SKAction.scale(to: 5, duration: 0.3)
                            let action2 = SKAction.colorize(with: UIColor(red: 1, green: 1, blue: 1, alpha: 0), colorBlendFactor: 1, duration: 0.3)
                            let action6 = SKAction.group( [action1,action2])
                            let action7 = SKAction.removeFromParent()
                            let action8 = SKAction.sequence([action6,action7])
                            touchedNode.run(action8)
                            m_score=m_score+1
                            let t1=m_arrayTarget.count
                            if(m_score>=t1){
                                let myLabel4 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
                                myLabel4.zPosition = 10
                                myLabel4.text = "Clear!";
                                myLabel4.fontSize = 200;
                                myLabel4.fontColor=UIColor(red: 1, green: 1,blue: 1, alpha: 200/255)
                                myLabel4.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
                                self.addChild(myLabel4)
                                myLabel4.alpha=0
                                let action3 = SKAction.fadeAlpha(to: 1, duration: 1)
                                myLabel4.run(action3)
                                timer.invalidate()
                                self.delegate_MyProtocol?.SceneChange("MyScore")
                            }
                            return
                        } else {
                        }
                    }
                }
            }
            if isCorrect==false{
                touchedNode.zPosition = 3
                let action1 = SKAction.scale(to: 1.0, duration: 0.2)
                let action2 = SKAction.wait(forDuration: 0.2)
                let action3 = SKAction.scale(to: 1.2, duration: 0.2)
                let action4 = SKAction.move(to: touchedNodePosition, duration: 0.2)
                let action5 = SKAction.scale(to: 1.0, duration: 0.2)
                let action6 = SKAction.sequence([action1,action2,action3,action4,action5])
                touchedNode.run(action6)
            }
        }
    }
    
    func Wordadd(_ string1:String,buttonx:SKNode){
        let myLabel4 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        myLabel4.zPosition=3
        myLabel4.text = string1;
        myLabel4.fontSize = 50;
        myLabel4.fontColor=UIColor(red: 255/255, green: 255/255,blue: 255/255, alpha: 150/255)
        buttonx.addChild(myLabel4)
        myLabel4.position = CGPoint(x:0,y:-18);
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
