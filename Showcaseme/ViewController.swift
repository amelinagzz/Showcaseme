//
//  ViewController.swift
//  Showcaseme
//
//  Created by Adriana Gonzalez on 2/17/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fbBtnPressed(sender: UIButton!) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            }else {
                let accesstoken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with facebook. \(accesstoken)")
                
                DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accesstoken, withCompletionBlock: { error, authData in
                    if error != nil {
                        print("Login failed \(error)")
                    }else {
                        print("Logged in.")
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        self.performSegueWithIdentifier("loggedIn", sender: nil)
                    }
                })
            }
        }
    }

}

