//
//  SpaceNode.swift
//  MySpace
//
//  Created by Powen Ko on 3/12/15.
//  Copyright (c) 2015 Powen Ko. All rights reserved.
//

import Foundation
import SpriteKit

class SpaceNode: SKSpriteNode{
    init(imageNamed name: String) { // 初始化
        let texture = SKTexture(imageNamed: name)
        super.init(texture: texture, color: UIColor.red, size: texture.size()) // 呼叫父類別函數
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
