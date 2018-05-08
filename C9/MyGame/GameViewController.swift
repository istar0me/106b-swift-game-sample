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
        self.skView!.presentScene(gameScene)
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
