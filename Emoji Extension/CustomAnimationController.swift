//
//  CustomAnimationController.swift
//  WatchApp
//
//  Created by Davinder on 26/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation


class CustomAnimationController: WKInterfaceController {

    @IBOutlet var secondImage: WKInterfaceImage!
    @IBOutlet var secondAnimation: WKInterfaceGroup!
    @IBOutlet var imageGroup: WKInterfaceGroup!
    @IBOutlet var ballImage: WKInterfaceImage!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        ballImage.setImageNamed("football_")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func downAction() {
        self.animateWithDuration(0.5) { () -> Void in
            self.imageGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.Bottom)
            self.ballImage.startAnimatingWithImagesInRange(NSMakeRange(1, 8), duration: 0.5, repeatCount: 1)
        }
        
    }
    @IBAction func upAction() {
        self.animateWithDuration(0.5) { () -> Void in
            self.imageGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.Top)
            self.ballImage.startAnimatingWithImagesInRange(NSMakeRange(1, 8), duration: 0.5, repeatCount: 1)
        }
    }
    @IBAction func rightAction() {
        self.animateWithDuration(0.5) { () -> Void in
            self.imageGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Right)
            self.ballImage.startAnimatingWithImagesInRange(NSMakeRange(1, 8), duration: 0.5, repeatCount: 1)
        }
    }
       @IBAction func leftAction() {
        self.animateWithDuration(0.5) { () -> Void in
            self.imageGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Left)
            self.ballImage.startAnimatingWithImagesInRange(NSMakeRange(1, 8), duration: 0.5, repeatCount: 1)
        }
    }
}
