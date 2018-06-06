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
    
    let POINTS_PER_SEC: CGFloat = 80.0 // 設定每秒移動的點(Dot)數
    // 移動飛碟
    func move(_ timer:TimeInterval){
        let currentPosition = position
        var newPosition = position
        if Steps.count>0 {
            let targetPoint = Steps[0]
            // 透過三角函數，計算現在位置和目標位置的距離
            let offset = CGPoint(x: targetPoint.x - currentPosition.x, y: targetPoint.y - currentPosition.y) // 分別計算 x, y 軸的位移
            let length = Double(sqrtf(Float(offset.x * offset.x) + Float(offset.y * offset.y))) // Sqrt(x^2+y^2)
            let direction = CGPoint(x:CGFloat(offset.x) / CGFloat(length), y: CGFloat(offset.y) / CGFloat(length))
            let velocity = CGPoint(x: direction.x * POINTS_PER_SEC, y: direction.y * POINTS_PER_SEC)
            
            newPosition = CGPoint(x:currentPosition.x + velocity.x * CGFloat(timer), y:currentPosition.y + velocity.y * CGFloat(timer))
            
            position = newPosition
            if frame.contains(targetPoint) { // 判斷是否已經到目標的位置
                Steps.remove(at: 0) // 移除矩陣資料
            }
        }
    }
}
