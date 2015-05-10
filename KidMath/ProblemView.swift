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
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var Button0: UIButton!
    @IBOutlet weak var ButtonDot: UIButton!
    @IBOutlet weak var ButtonNeg: UIButton!
    @IBOutlet weak var ButtonBackspace: UIButton!
    
    
    var problemTypeText: String?
    var answer: Int = 0
    
    var additionButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button1 = UIBarButtonItem(title: "0", style: .Plain, target: self, action: "")
        var button2 = UIBarButtonItem(title: "0", style: .Plain, target: self, action: "")
        button1.tintColor = UIColor.greenColor()
        button2.tintColor = UIColor.redColor()
        self.navigationItem.rightBarButtonItems = NSArray(array: [button1, button2]) as [AnyObject]
//        println("lkbja: \(problemTypeText!)")
        var sign = problemTypeText!.componentsSeparatedByString(" ")[1]
        problemType.text = sign
//        problemType.sizeToFit()
        newProblem(level: 1, mathType: sign)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            // if answer empty don't do anything on backspace press, otherwise delete last character
            if answerInput.text != "" { answerInput.text! = dropLast(answerInput.text!) }
        } else if sender.currentTitle == "-" {
            // if input field is empty, add negative sign
            if answerInput.text == "" {
                answerInput.text! = "-"
        // else toggle the negative sign in the answer
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
        println("answer: \(answer)\nUser Answer: \(answerInput.text!)")
        if answerInput.text! == String(answer) {
            correct = "Correct"
        } else {
            correct = "Wrong"
        }
        let alert = UIAlertController(title: "Results", message: correct, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
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
