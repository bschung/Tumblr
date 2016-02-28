//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Brenda Chung on 2/23/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var exploreImageView: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var viewControllers: [UIViewController]!
    var fadeTransition: FadeTransition!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        viewControllers = [homeViewController, searchViewController, composeViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])

    }
    
    override func viewDidAppear(animated: Bool)
    {
        UIView.animateWithDuration(2, delay: 0,
            options: [.Repeat, .Autoreverse], animations: {
                self.exploreImageView.transform = CGAffineTransformMakeTranslation(0, -5)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSearch(sender: AnyObject) {
        UIView.animateWithDuration(0.4, delay: 0,
            options: [], animations: {
                self.exploreImageView.alpha = 0
            }, completion: nil)
    }
    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        
        //Set the selectedIndex to the tag value of which ever button was tapped.
        selectedIndex = sender.tag
        
        //Within your didPressTab method, use your previousIndex value to access your previous button and set it to the non-selected state.
        buttons[previousIndex].selected = false
        //Use the previousIndex to access the previous ViewController from the viewControllers array.
        let previousVC = viewControllers[previousIndex]
        //Remove the previous ViewController
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //Within your didPressTab method, access your current selected button and set it to the selected state.
        sender.selected = true
        //Use the selectedIndex to access the current ViewController from the viewControllers array.
        let vc = viewControllers[selectedIndex]
        //Add the new ViewController. (Calls the viewWillAppear method of the ViewController you are adding)
        addChildViewController(vc)
        //Adjust the size of the ViewController view you are adding to match the contentView of your tabBarViewController and add it as a subView of the contentView.
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        //Call the viewDidAppear method of the ViewController you are adding using didMoveParentViewController(self).
        vc.didMoveToParentViewController(self)
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
