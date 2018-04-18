//
//  GameScene.swift
//  MyWord
//
//  Created by Powen Ko on 2/20/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
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
        
        
        // 3. 左上角的時間(30)
        let myLabel3 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        
        myLabel3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        myLabel3.text = "30";
        myLabel3.fontSize = 50;
        myLabel3.fontColor=UIColor(red: 1/255, green: 1/255,blue: 1/255, alpha: 150/255)
        
        myLabel3.position = CGPoint(x:220+30,y: Int(self.size.height)-160);
        self.addChild(myLabel3)
        
        
        // 4. 背景圖片
        let bgImage = SKSpriteNode(imageNamed: "game4bg.jpg")
        bgImage.zPosition = -1
        self.addChild(bgImage)
        bgImage.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        
        showWords("APPLE")
        showTargetWords("     ")
    }
    
	// 設定目標的空格
    func showTargetWords(_ string1: String) {
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
            let y1=500
            let Str1:String=String(firstChar)
            showTargetWord(Str1,x1:x1,y1:y1)
        }
    }
    
    // 顯示文字和方塊
    func showTargetWord(_ string1:String,x1:Int,y1:Int ) {
        // 顯示空格圖片
        let button2 = SKSpriteNode(imageNamed: "button1.png")
        button2.zPosition = 1
        self.addChild(button2)
        button2.position = CGPoint(x:x1, y:y1);
        button2.name=string1;


        // 顯示文字
        let myLabel4 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        
        myLabel4.zPosition=2
        myLabel4.text = string1;
        myLabel4.fontSize = 50;
        myLabel4.fontColor=UIColor(red: 255/255, green: 255/255,blue: 255/255, alpha: 150/255)
        //myLabel4.position = CGPoint(x:x1,y: y1-18);
        // self.addChild(myLabel4)
        
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
        let button2 = SKSpriteNode(imageNamed: "button2.png")
        button2.zPosition = 1
        self.addChild(button2)
        button2.position = CGPoint(x:x1, y:y1);
        button2.name=string1;
		
		
		// 6. 英文字母
        let myLabel4 = SKLabelNode(fontNamed:"AmericanTypewriter-Bold")
        
        myLabel4.zPosition=2
        myLabel4.text = string1;
        myLabel4.fontSize = 50;
        myLabel4.fontColor=UIColor(red: 255/255, green: 255/255,blue: 255/255, alpha: 150/255)
        
        button2.addChild(myLabel4)
        myLabel4.position = CGPoint(x:0,y:-18);
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
   
    override func update(_ currentTime: TimeInterval) {
    }
}
