//
//  LoginViewController.swift
//  Tumblr
//
//  Created by Brenda Chung on 2/27/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var fadeTransition: FadeTransition!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onPressCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
    var destinationViewController = segue.destinationViewController

    // Set the modal presentation style of your destinationViewController to be custom.
    destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom

    // Create a new instance of your fadeTransition.
    fadeTransition = FadeTransition()

    // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
    destinationViewController.transitioningDelegate = fadeTransition

    // Adjust the transition duration. (seconds)
    fadeTransition.duration = 1.0
    }
}
