//
//  InterfaceController.swift
//  Emoji Extension
//
//  Created by Davinder on 22/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func buttonPressEvent() {
        
//        pushControllerWithName("CategoryScene", context: nil);
        presentControllerWithName("AnimationScene", context: nil)
    }
}
