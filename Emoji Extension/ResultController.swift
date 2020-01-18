//
//  ResultController.swift
//  WatchApp
//
//  Created by Davinder on 23/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation


class ResultController: WKInterfaceController {

    @IBOutlet var resultLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
//        let str = context as! String
        resultLabel.setText("hello")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func homeButtonAction() {
//        pushControllerWithName("HomeScene", context: nil)
       resultLabel.setTextColor(UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.2))
    }
    @IBAction func replayAction() {
         pushControllerWithName("GameScene", context: nil)
    }
}
