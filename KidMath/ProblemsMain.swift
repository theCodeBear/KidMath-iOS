//
//  ProblemsMain.swift
//  KidMath
//
//  Created by Todd Kronenberg on 5/8/15.
//  Copyright (c) 2015 Todd Kronenberg. All rights reserved.
//

import UIKit

class ProblemsMain: UIViewController {
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var arithmeticButton: UIButton!
    var problemType: String?
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Problem Types"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.plusButton.addTarget(self, action: "clickPlusButton:", forControlEvents: .TouchUpInside)
        self.subtractButton.addTarget(self, action: "clickSubtractButton:", forControlEvents: .TouchUpInside)
        self.multiplyButton.addTarget(self, action: "clickMultiplyButton:", forControlEvents: .TouchUpInside)
        self.divideButton.addTarget(self, action: "clickDivideButton:", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickPlusButton(sender: AnyObject) { self.performSegueWithIdentifier("toProblemView", sender: sender as! UIButton) }
    
    @IBAction func clickSubtractButton(sender: AnyObject) { self.performSegueWithIdentifier("toProblemView", sender: sender as! UIButton) }
    
    @IBAction func clickMultiplyButton(sender: AnyObject) { self.performSegueWithIdentifier("toProblemView", sender: sender as! UIButton) }
    
    @IBAction func clickDivideButton(sender: AnyObject) { self.performSegueWithIdentifier("toProblemView", sender: sender as! UIButton) }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        segue.identifier == "toProblemView"
        var button = sender as! UIButton
        var text = button.currentTitle
        let destinationVC = segue.destinationViewController as! ProblemView
        destinationVC.problemTypeText = text
        navigationItem.title = " "
    }
    

}
