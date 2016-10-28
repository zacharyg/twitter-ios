//
//  ViewController.swift
//  TwitterClone
//
//  Created by Zachary West Guo on 10/19/16.
//  Copyright © 2016 zechariah. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class ViewController: UIViewController {

    @IBOutlet weak var twitterLogo: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //rounded button
        signInButton.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animateWithDuration(3, animations: {
            self.signInButton.alpha = 1.0
            self.twitterLogo.alpha = 1.0
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginButton(sender: AnyObject) {
        
        TwitterClient.sharedInstance.login({
            print("I've logged in!")
            self.performSegueWithIdentifier("loginSegue", sender: nil)
        }) { (error:NSError) in
            print(error.localizedDescription)
        }
        
        
    }

}

