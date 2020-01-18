//
//  GamePlayController_1.swift
//  WatchApp
//
//  Created by Davinder on 24/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation


class GamePlayController_1: WKInterfaceController {

    @IBOutlet var table:WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        table.setNumberOfRows(5, withRowType: "FirstRowController")
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
