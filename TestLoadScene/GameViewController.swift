//
//  GameViewController.swift
//  TestLoadScene
//
//  Created by Stephen Brennan on 8/1/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, Controller {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let scene = OpeningScene(fileNamed:"Opening") {
            massageScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func startGame() {
        if let scene = GameScene(fileNamed:"GameScene") {
            massageScene(scene)
        }
    }
    
    func massageScene(scene: SKScene) {
        
        let skView = self.view as! SKView
        let ss = scene as! Scene
        ss.setController(self)
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
    }
    func gameOver() {
        if let scene = GameOver(fileNamed:"GameOver") {
            massageScene(scene)
        }
    }

}
