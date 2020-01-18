//
//  QuestionsController.swift
//  WatchApp
//
//  Created by Davinder on 22/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation

class QuestionsController: WKInterfaceController {

    @IBOutlet var scoreLabel: WKInterfaceLabel!
    @IBOutlet var quesLabel: WKInterfaceLabel!
    @IBOutlet var answerPicker: WKInterfacePicker!
    var itemList =  [String]()
    var pickerItems = [WKPickerItem]()
    var quesDict: NSDictionary?
    var opt_1_Dict: NSDictionary?
    var opt_2_Dict: NSDictionary?
    var opt_3_Dict: NSDictionary?
    var ansDict: NSDictionary?
    var quesNo:UInt32?
    var currentSelectedOption:Int?
    var score:Int?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let categoryName:String = context as! String
        print("context data is \(categoryName)")
        
        quesNo = arc4random()%10
        print("question no is\(quesNo)")
        setQuesAndOptions(Int(quesNo!))

    }

    override init() {
        
        currentSelectedOption = 1
        
        let path_1 = NSBundle.mainBundle().pathForResource("Ques", ofType: "plist")
        quesDict = NSDictionary(contentsOfFile: path_1!)

        let path_2 = NSBundle.mainBundle().pathForResource("opt_1", ofType: "plist")
        opt_1_Dict = NSDictionary(contentsOfFile: path_2!)

        let path_3 = NSBundle.mainBundle().pathForResource("opt_2", ofType: "plist")
        opt_2_Dict = NSDictionary(contentsOfFile: path_3!)

        let path_4 = NSBundle.mainBundle().pathForResource("opt_3", ofType: "plist")
        opt_3_Dict = NSDictionary(contentsOfFile: path_4!)
        
        let path_5 = NSBundle.mainBundle().pathForResource("corr_ans", ofType: "plist")
        ansDict = NSDictionary(contentsOfFile: path_5!)
        
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func setQuesAndOptions(ques:Int)
    {
        //---set question label
        let quesStr = quesDict?.objectForKey(String(ques)) as! String
        quesLabel.setText(quesStr)
        //-----set options
        let quesItem1 = WKPickerItem();
        quesItem1.title = opt_1_Dict?.objectForKey(String(ques)) as? String
        let quesItem2 = WKPickerItem();
        quesItem2.title = opt_2_Dict?.objectForKey(String(ques)) as? String
        
        let quesItem3 = WKPickerItem();
        quesItem3.title = opt_3_Dict?.objectForKey(String(ques)) as? String
        
        pickerItems.append(quesItem1)
        pickerItems.append(quesItem2)
        pickerItems.append(quesItem3)
        
        answerPicker.setItems(pickerItems)
    }
    
    @IBAction func pickerItemEvent(value: Int) {
        print("current item number is\(value)");
        currentSelectedOption = value + 1;
    }
    
    @IBAction func buttonPressedEvent() {
        let no = Int(quesNo!)
        let ans = ansDict?.objectForKey(String(no)) as? Int
        print("correct ans no: \(ans)")
        if currentSelectedOption == ans
        {
        print("correct")
        }
        else
        {
        print("false")
        }
    }
}
