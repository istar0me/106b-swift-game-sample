//
//  GameViewController.swift
//  test3
//
//  Created by Powen Ko on 8/7/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameScene(fileNamed:"GameScene") { // 讀入主畫面
            let skView = self.view as! SKView
            //skView.showsFPS = true // 顯示 FPS 資訊
            //skView.showsNodeCount = true // 顯示 Node 數量
            
            /* 設定使用畫面的最佳化效果提高渲染性能 */
            skView.ignoresSiblingOrder = true
            
            /* 調整場景大小縮放比，來符合手機畫面 */
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
        }
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
    
    override func didReceiveMemoryWarning() { // 記憶體警告處理
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden : Bool { // 隱藏狀態欄
        return true
    }
}
