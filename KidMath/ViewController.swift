//
//  ViewController.swift
//  KidMath
//
//  Created by Todd Kronenberg on 5/8/15.
//  Copyright (c) 2015 Todd Kronenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var newParentButton: UIButton!


    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "KidMath"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.guestButton.addTarget(self, action: "guestButtonClick:", forControlEvents: .TouchUpInside)
        self.newParentButton.addTarget(self, action: "newParentButtonClick:", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guestButtonClick(sender: AnyObject) {
        self.performSegueWithIdentifier("toProblemsMain", sender: sender as! UIButton)
    }
    
    @IBAction func newParentButtonClick(sender: AnyObject) {
        self.performSegueWithIdentifier("toNewParent", sender: sender as! UIButton)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = " "
    }


}

