//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Brenda Chung on 2/23/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var buttons = [UIButton]()
    var buttonsOriginalYs = [CGFloat]()
    var buttonsYs = [CGFloat]()
    var yOffset = 700
    var newYOffset = -1000
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttons = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]
        
        // Save original position
        for button in buttons {
            buttonsOriginalYs.append(button.frame.origin.y)
            let translateY = CGFloat(yOffset) - button.frame.origin.y
            buttonsYs.append(translateY)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressNevermind(sender: AnyObject) {
        
        print("didPressNevermind")
        print(self.buttonsYs[0])
        UIView.animateWithDuration(0.4, delay: 0.2, options: [], animations: { () -> Void in
            self.buttons[1].transform = CGAffineTransformMakeTranslation(0, CGFloat(self.newYOffset))
            self.buttons[4].transform = CGAffineTransformMakeTranslation(0, CGFloat(self.newYOffset))
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.2, delay: 0.4, options: [], animations: { () -> Void in
            self.buttons[2].transform = CGAffineTransformMakeTranslation(0, CGFloat(self.newYOffset))
            self.buttons[0].transform = CGAffineTransformMakeTranslation(0, CGFloat(self.newYOffset))
            }, completion: nil)
        
        UIView.animateWithDuration(0.2, delay: 0.5, options: [], animations: { () -> Void in
            self.buttons[3].transform = CGAffineTransformMakeTranslation(0, CGFloat(self.newYOffset))
            self.buttons[5].transform = CGAffineTransformMakeTranslation(0, CGFloat(self.newYOffset))
            }, completion: {(Bool) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
        })
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        print("before")
        // Set the initial positions of the compose buttons to below the screen.
        for button in buttons {
            button.frame = CGRectMake(button.frame.origin.x, CGFloat(yOffset), button.frame.width, button.frame.height)
        print(button.frame)
            
        }
    }

    override func viewDidAppear(animated: Bool) {
        // Schedule the animations of the compose buttons.

        
        print("after")
        print(self.buttonsYs[0])
        UIView.animateWithDuration(0.4, delay: 0.2, options: [], animations: { () -> Void in
            self.buttons[1].transform = CGAffineTransformMakeTranslation(0, -self.buttonsYs[1])
            self.buttons[4].transform = CGAffineTransformMakeTranslation(0, -self.buttonsYs[4])
            }, completion: nil)

        UIView.animateWithDuration(0.2, delay: 0.4, options: [], animations: { () -> Void in
            self.buttons[2].transform = CGAffineTransformMakeTranslation(0, -self.buttonsYs[2])
            self.buttons[0].transform = CGAffineTransformMakeTranslation(0, -self.buttonsYs[0])
            }, completion: nil)
        
        UIView.animateWithDuration(0.2, delay: 0.5, options: [], animations: { () -> Void in
            self.buttons[3].transform = CGAffineTransformMakeTranslation(0, -self.buttonsYs[3])
            self.buttons[5].transform = CGAffineTransformMakeTranslation(0, -self.buttonsYs[5])
            }, completion: nil)
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
    let destinationViewController = segue.destinationViewController
    
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
