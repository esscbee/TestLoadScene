//
//  GameScene.swift
//  TestLoadScene
//
//  Created by Stephen Brennan on 8/1/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

var count = 0

class GameScene: SKScene, Scene {
    var reload = false
    var controller : Controller!
    
    func setController(controller : Controller) {
        self.controller = controller
    }
    
    override func didMoveToView(view: SKView) {
        count += 1
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World! \(count)"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let n = nodeAtPoint(location)
            if n != self {
                reload = true
            } else {
                
                let sprite = SKSpriteNode(imageNamed:"Spaceship")
                
                sprite.xScale = 0.5
                sprite.yScale = 0.5
                sprite.position = location
                
                let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
                
                sprite.runAction(SKAction.repeatActionForever(action))
                
                self.addChild(sprite)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        if reload {
            controller.gameOver()
        }
    }
}
