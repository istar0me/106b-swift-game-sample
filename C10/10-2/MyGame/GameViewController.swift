//
//  GameViewController.swift
//  MyGame
//
//  Created by Powen Ko on 2/11/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController, MyProtocol {
    var skView: SKView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.skView = self.view as? SKView
        //goMainMenu()
        //goMyStage()
        SceneChange("MainMenu")
        
    }
    func SceneChange(_ scene: String) {
        if scene == "MainMenu" {
            self.goMainMenu()
        }else if scene == "MyStage" {
            self.goMyStage()
        }else if scene == "MyWord" {
            self.goMyWord()
        }else if scene == "MyScore" {
            self.goMyScore()
        }
        
        
        
    }
    
    func goMainMenu() {
        let gameScene = GameScene(size: CGSize(width: 1024, height: 768))
        gameScene.delegate_MyProtocol = self
        gameScene.scaleMode = SKSceneScaleMode.aspectFill
        let action1=SKTransition.fade(withDuration: 2)
        self.skView!.presentScene(gameScene, transition: action1)
    }
    
    
    func goMyStage() {
        let gameScene = MyStage(size: CGSize(width: 1024, height: 768))
        gameScene.delegate_MyProtocol = self
        gameScene.scaleMode = SKSceneScaleMode.aspectFill
        //  var action1=SKTransition.flipHorizontalWithDuration(2)
        //  var action1=SKTransition.flipVerticalWithDuration(2)
        
        //  var action1=SKTransition.doorsCloseHorizontalWithDuration(2)
        //var action1=SKTransition.doorsCloseVerticalWithDuration(2)
        // var action1=SKTransition.doorsOpenHorizontalWithDuration(2)
        // var action1=SKTransition.doorsOpenVerticalWithDuration(2)
        //  var action1=SKTransition.doorwayWithDuration(2)
        //  var action1=SKTransition.moveInWithDirection(SKTransitionDirection.Up , duration: 2)
        // var action1=SKTransition.fadeWithDuration(2)
        
        let action1=SKTransition.push(with: SKTransitionDirection.up , duration: 2)
        self.skView!.presentScene(gameScene, transition: action1)
        // self.skView!.presentScene(gameScene)
    }
    
    
    func goMyWord() {
        let gameScene = MyWord(size: CGSize(width: 1024, height: 768))
        gameScene.delegate_MyProtocol = self
        gameScene.scaleMode = SKSceneScaleMode.aspectFill
        let action1=SKTransition.flipHorizontal(withDuration: 2)
        //  var action1=SKTransition.flipVerticalWithDuration(2)
        self.skView!.presentScene(gameScene, transition: action1)
    }
    
    func goMyScore() {
        let gameScene = MyScore(size: CGSize(width: 1024, height: 768))
        gameScene.delegate_MyProtocol = self
        gameScene.scaleMode = SKSceneScaleMode.aspectFill
        //var action1=SKTransition.flipHorizontalWithDuration(2)
        let action1=SKTransition.flipVertical(withDuration: 2)
        self.skView!.presentScene(gameScene, transition: action1)
    }
    
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
