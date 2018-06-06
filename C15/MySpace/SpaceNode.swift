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
    var Steps:[CGPoint]=[] // 紀錄路徑的陣列
    init(imageNamed name: String) { // 初始化
        let texture = SKTexture(imageNamed: name)
        super.init(texture: texture, color: UIColor.red, size: texture.size()) // 呼叫父類別函數
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 清除陣列資料
    func arrayClear(){
        Steps.removeAll(keepingCapacity: false)
    }
    
    // 加上一筆陣列資料
    func arrayAdd(_ step:CGPoint){
        Steps.append(step)
        print(step.x)
    }
    
    // 移動飛碟
    func move(_ timer:TimeInterval){
        if Steps.count>0 {
            let newPosition=Steps[0]
            position = newPosition
            Steps.remove(at: 0)
        }
    }
}
