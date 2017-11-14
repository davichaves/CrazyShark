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
        
        /* Set reference to scroll layer node */
        scrollLayer = self.childNode(withName: "scrollLayer")
        
        /* Recursive node search for 'hero' (child of referenced node) */
        shark = self.childNode(withName: "//shark") as! SKSpriteNode
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.location(in: self)

            /* Reset velocity */
            shark.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            
            let scale:CGFloat = 0.05
            
            let deltax = (location.x - shark.position.x)*scale
            print("location x:\(location.x)")
            print("shark x:\(shark.parent?.position.x)")
            print("delta x:\(deltax)")
            let deltay = (location.y - shark.position.y)*scale
            print("delta y:\(deltay)")
            print("location y:\(location.y)")
            print("shark y:\(shark.parent?.position.y)")
            
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
