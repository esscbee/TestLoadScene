//
//  GameOver.swift
//  TestLoadScene
//
//  Created by Stephen Brennan on 8/1/16.
//  Copyright © 2016 Stephen Brennan. All rights reserved.
//

import Foundation
import SpriteKit

class GameOver : SKScene, Scene {
    
    var controller : Controller!
    
    func setController(controller: Controller) {
        self.controller = controller
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        controller.startGame()
    }

}
