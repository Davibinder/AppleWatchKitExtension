//
//  CategoryController.swift
//  WatchApp
//
//  Created by Davinder on 22/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation

class CategoryController: WKInterfaceController {

    var category:String!
    
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
   
    @IBAction func level_1Action() {
        category = "1"
//        pushControllerWithName("GameScene", context:category)
        presentControllerWithName("GameScene", context:category)
    }

    
    @IBAction func level_2Action() {
        category = "2"
//        pushControllerWithName("QuestionsScene", context:category)
        presentControllerWithName("CustomAnimationScene", context:category)

    }
    
    @IBAction func level_3Action() {
        category = "3"
//        pushControllerWithName("QuestionsScene", context:category)
        presentControllerWithName("AnimationScene", context:category)

    }
    
}
