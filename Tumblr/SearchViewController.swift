//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Brenda Chung on 2/23/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchFeedView: UIImageView!
    @IBOutlet weak var loadingImageView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFeedView.alpha = 0
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        loadingImageView.image = animatedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        // Hide the background image feed and show the custom loading indicator
        searchFeedView.alpha = 0
        loadingImageView.alpha = 1
    }
    
    override func viewDidAppear(animated: Bool) {
        //Add a delay method.
        UIView.animateWithDuration(0.2, delay: 1, options: [], animations: { () -> Void in
        self.loadingImageView.alpha = 0
        self.searchFeedView.alpha = 1
    }, completion: nil)
    
        
        //In the completion block of the delay, hide the custom loading indicator and show the background image feed.

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
