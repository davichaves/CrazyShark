//
//  GameScene.swift
//  CrazyShark
//
//  Created by Davi Rodrigues Chaves on 11/7/17.
//  Copyright © 2017 Davi Chaves. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    let fixedDelta: CFTimeInterval = 1.0/60.0 /* 60 FPS */
    let scrollSpeed: CGFloat = 160
    
    var scrollLayer: SKNode!
    var shark: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        /* Finding the shark node */
        shark = self.childNode(withName: "Shark") as! SKSpriteNode
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)

            /* Reset velocity */
            shark.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            
            let scale:CGFloat = 0.02
            
            var deltax = (location.x - shark.position.x)*scale
            if(deltax > 10) {
                deltax = 10;
            } else if (deltax < -10) {
                deltax = -10;
            }
            print("deltax: \(deltax)")
            var deltay = (location.y - shark.position.y)*scale
            if(deltay > 10) {
                deltay = 10;
            } else if (deltay < -10) {
                deltay = -10;
            }
            print("deltay: \(deltay)")
            print("angle: \(atan2(deltay, deltax))")
            
            let rotation:SKAction = SKAction.rotate(toAngle: atan2(deltay, deltax), duration: 0.1)
            
            shark.run(rotation)
            shark.physicsBody?.applyImpulse(CGVector(dx: deltax, dy: deltay))
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        /* Process world scrolling */
        //scrollWorld()
    }
    
    func scrollWorld() {
        /* Scroll World */
        scrollLayer.position.x -= scrollSpeed * CGFloat(fixedDelta)
    }
}
