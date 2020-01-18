//
//  AnimationController.swift
//  WatchApp
//
//  Created by Davinder on 25/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation


class AnimationController: WKInterfaceController {

    @IBOutlet var ball: WKInterfaceImage!
//    @IBOutlet var Player_1: WKInterfaceImage!
    @IBOutlet var player: WKInterfaceImage!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    
        // Configure interface objects here.
        player.setImageNamed("frame_")
        player.startAnimatingWithImagesInRange(NSMakeRange(1, 14), duration: 2, repeatCount: -1)
        ball.setImageNamed("ball_")
        ball.startAnimatingWithImagesInRange(NSMakeRange(1, 7), duration: 5.1, repeatCount: -1)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
