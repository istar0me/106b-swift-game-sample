//
//  GameViewController.swift
//  test3
//
//  Created by Powen Ko on 8/7/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, MyProtocol {
    var skView: SKView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.skView = self.view as? SKView
        SceneChange("MainMenu")
    }
    
    func SceneChange(_ scene: String) {
        if scene == "MainMenu" {
            self.goMainMenu()
        }else if scene == "MyStage" {
            self.goMyStage()
        }
    }
    
    func goMainMenu() {
        let gameScene = GameScene(size: CGSize(width: 1024, height: 768))
        gameScene.delegate_MyProtocol = self
        gameScene.scaleMode = SKSceneScaleMode.aspectFill
        self.skView!.presentScene(gameScene)
    }
    
    func goMyStage() {
        let gameScene = MyStage(size: CGSize(width: 1024, height: 768))
        gameScene.delegate_MyProtocol = self
        gameScene.scaleMode = SKSceneScaleMode.aspectFill
        // var action1=SKTransition.flipHorizontalWithDuration(2)
        // var action2=SKTransition.flipVerticalWithDuration(2)
        // var action3=SKTransition.doorsCloseHorizontalWithDuration(2)
        // var action4=SKTransition.doorsCloseVerticalWithDuration(2)
        // var action5=SKTransition.doorsOpenHorizontalWithDuration(2)
        // var action6=SKTransition.doorsOpenVerticalWithDuration(2)
        // var action7=SKTransition.doorwayWithDuration(2)
        // var action8=SKTransition.moveInWithDirection(SKTransitionDirection.Up , duration: 2)
        // var action9=SKTransition.fadeWithDuration(2)
        let action10=SKTransition.push(with: SKTransitionDirection.up , duration: 2)
        self.skView!.presentScene(gameScene, transition: action10)
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
