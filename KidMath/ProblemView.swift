//
//  ProblemView.swift
//  KidMath
//
//  Created by Todd Kronenberg on 5/8/15.
//  Copyright (c) 2015 Todd Kronenberg. All rights reserved.
//

import UIKit

class ProblemView: UIViewController {
    
    @IBOutlet weak var problemType: UILabel!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var answerInput: UILabel!
    @IBOutlet weak var navbar: UINavigationItem!
    
    var problemTypeText: String?
    var answer: Int = 0
    var additionButton = UIButton()
    var button1: UIBarButtonItem!
    var button2: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.hidesBackButton = true
        
        button1 = UIBarButtonItem(title: "0", style: .Plain, target: self, action: "")
        button2 = UIBarButtonItem(title: "0", style: .Plain, target: self, action: "")
        button1.tintColor = UIColor.greenColor()
        button2.tintColor = UIColor.redColor()
        self.navigationItem.rightBarButtonItems = NSArray(array: [button1, button2]) as [AnyObject]
        var sign = problemTypeText!.componentsSeparatedByString(" ")[1]
        problemType.text = sign
//        problemType.sizeToFit()
        writeViewTitle(mathType: sign)
        newProblem(level: 1, mathType: sign)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func writeViewTitle(#mathType: String) {
        if mathType == "+" {
            navbar.title = "Addition"
        } else if mathType == "-" {
            navbar.title = "Subtraction"
        } else if mathType == "x" {
            navbar.title = "Multiplication"
        } else if mathType == "÷" {
            navbar.title = "Division"
        }
    }
    
    func newProblem(#level: Int, mathType: String) {
        var num1 = Int(arc4random_uniform(10) + 1)
        var num2 = Int(arc4random_uniform(10) + 1)
        if mathType == "+" {
            answer = num1 + num2
        } else if mathType == "-" {
            answer = num1 - num2
        } else if mathType == "x" {
            answer = num1 * num2
        } else if mathType == "÷" {
            num1 = num2 * Int(arc4random_uniform(3) + 1)
            answer = num1 / num2
        }
        number1.text = String(num1)
        number2.text = String(num2)
    }

    @IBAction func numberPress(#sender: UIButton) {
        if sender.currentTitle == "Backspace" {
            if answerInput.text != "" { answerInput.text! = dropLast(answerInput.text!) }
        } else if sender.currentTitle == "-" {
            if answerInput.text == "" {
                answerInput.text! = "-"
            } else if answerInput.text![answerInput.text!.startIndex] == "-" {
                answerInput.text = dropFirst(answerInput.text!)
            } else {
                answerInput.text!.insert("-", atIndex: answerInput.text!.startIndex)
            }
        } else {
            answerInput.text! += sender.currentTitle!
        }
    }

    @IBAction func checkAnswer() {
        var correct: String = ""
        if answerInput.text! == String(answer) {
            correct = "Correct"
            button1.title! = String(button1.title!.toInt()! + 1)
        } else {
            correct = "Wrong"
            button2.title! = String(button2.title!.toInt()! + 1)
        }
        answerInput.text = ""
        newProblem(level: 1, mathType: problemType.text!)
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
