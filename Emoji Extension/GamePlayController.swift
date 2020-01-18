//
//  GamePlayController.swift
//  WatchApp
//
//  Created by Davinder on 23/02/16.
//  Copyright © 2016 ChicMic. All rights reserved.
//

import WatchKit
import Foundation


class GamePlayController: WKInterfaceController {
    @IBOutlet var buttonA: WKInterfaceButton!
    @IBOutlet var buttonB: WKInterfaceButton!
    @IBOutlet var buttonC: WKInterfaceButton!
    @IBOutlet var buttonD: WKInterfaceButton!
    @IBOutlet var buttonE: WKInterfaceButton!
    @IBOutlet var buttonF: WKInterfaceButton!
    @IBOutlet var buttonG: WKInterfaceButton!
    @IBOutlet var buttonH: WKInterfaceButton!
    @IBOutlet var buttonI: WKInterfaceButton!
    @IBOutlet var buttonJ: WKInterfaceButton!
    @IBOutlet var buttonK: WKInterfaceButton!
    @IBOutlet var buttonL: WKInterfaceButton!

    @IBOutlet var animalImage: WKInterfaceImage!
    @IBOutlet var quesLabel: WKInterfaceLabel!

    @IBOutlet var ansLabel: WKInterfaceLabel!
    
    @IBOutlet var timerLabel: WKInterfaceLabel!
    var quesNo:UInt32?
    var ansString:String?
    var correctAnswer:String?
    var quesDict: NSDictionary?
    
    var ansCharacters = [Character]()
    var buttonArray = [WKInterfaceButton]()
    var buttonIndexArray = [UInt32]()
    
    let defaltCharacters = [Character](arrayLiteral: "a","b","c","d","e","f","g","h","i","j","k","l")
    
    var counter = Int()
    var timer = NSTimer()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        ansString = ""
        quesNo = arc4random_uniform(8)
        
        //--timer
        counter = 15
        let str = String(counter)
        timerLabel.setText(str)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update" , userInfo: nil, repeats: true)
        
        buttonArray.append(buttonA);
        buttonArray.append(buttonB);
        buttonArray.append(buttonC);
        buttonArray.append(buttonD);
        buttonArray.append(buttonE);
        buttonArray.append(buttonF);
        buttonArray.append(buttonG);
        buttonArray.append(buttonH);
        buttonArray.append(buttonI);
        buttonArray.append(buttonJ);
        buttonArray.append(buttonK);
        buttonArray.append(buttonL);
        
        //--default keywords
        for index in 0...11
        {
            let button = buttonArray[index]
            let str = defaltCharacters[index]
            button.setTitle(String(str))
        }
        
        setKeypad(Int(quesNo!))
        setQuestionAndImage(Int(quesNo!))
        
    }

    override init() {
        let path_1 = NSBundle.mainBundle().pathForResource("Ques", ofType: "plist")
        quesDict = NSDictionary(contentsOfFile: path_1!)

    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func update()
    {
        counter = counter - 1
        let str = String(counter)
        timerLabel.setText(str)
        if counter <=  0
        {
        timer.invalidate()
//        pushControllerWithName("GameScene", context: nil)
//            dismissController()
            
            presentControllerWithName("GameScene", context: nil)
//            dismissController()
        }
    }
    
    func setKeypad(ques:Int)
    {
        let animal = quesDict?.objectForKey(String(ques)) as! String
        let characters = Array(animal.characters)
        ansCharacters = characters
        print(ansCharacters)
        for item in ansCharacters
        {
            let char = item
            print("charcater is \(char)")
            var index = arc4random_uniform(11)
            
            for i  in buttonIndexArray
            {
              if index == i
              {
                while index == i
                {
                index = arc4random_uniform(11)
                }
              }
            }
            
            print("index is \(index)")

            buttonIndexArray.append(index)
            
            let button = buttonArray[Int(index)]
            button.setTitle(String(char))
        }
        print(buttonIndexArray)
        
    }
    
    func setQuestionAndImage(ques:Int)
    {
        let animal = quesDict?.objectForKey(String(ques)) as! String
        correctAnswer = animal
        animalImage.setImageNamed(animal+".png")
        
    }
    
    @IBAction func cacelButton() {
      if ansString?.characters.count > 0
      {
      ansString?.removeAtIndex(ansString!.endIndex.predecessor())
        ansLabel.setText(ansString)
        }
    }
    @IBAction func buttonAction_A() {
        updateButtonString(0)
    }
    @IBAction func buttonAction_B() {
        updateButtonString(1)
    }
    @IBAction func buttonAction_C() {
        updateButtonString(2)
    }
    @IBAction func buttonAction_D() {

        updateButtonString(3)
    }
    @IBAction func buttonAction_E() {
        updateButtonString(4)
    }
    @IBAction func buttonAction_F() {
        updateButtonString(5)
    }
    @IBAction func buttonAction_G() {
        updateButtonString(6)
    }
    @IBAction func buttonAction_H() {
        updateButtonString(7)
    }
    @IBAction func buttonAction_I() {
        updateButtonString(8)
    }
    @IBAction func buttonAction_J() {
        updateButtonString(9)
    }
    @IBAction func buttonAction_K() {
        updateButtonString(10)
    }
    @IBAction func buttonAction_L() {
        updateButtonString(11)
    }
    
    @IBAction func okButtonAction() {
        if correctAnswer == ansString
        {
        pushControllerWithName("ResultScene", context: String("congrats"))
        }
        else
        {
        pushControllerWithName("ResultScene", context: String("you loose"))
        }
        
    }
    
    func updateButtonString(index:UInt32)
    {
        var char:String = ""
        for i  in buttonIndexArray
        {
            if index == i
            {
                let a = buttonIndexArray.indexOf(i)
                char = String(ansCharacters[Int(a!)])
            }
            
        }
        
        if char == ""
        {
        char = String(defaltCharacters[Int(index)])
        }
        
        ansString = ansString! + char
        ansLabel.setText(ansString)
    }
}
