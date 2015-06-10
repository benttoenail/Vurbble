//
//  LoginSignUpViewController.swift
//  vurbble
//
//  Created by Max Rose on 6/4/15.
//  Copyright (c) 2015 Max Rose. All rights reserved.
//

import UIKit

class LoginSignUpViewController: PFLogInViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.signUpController!.delegate = self
        
        self.logInView!.logo = UIImageView(image: UIImage(named: "Logo"))
        self.signUpController!.signUpView!.logo = UIImageView(image: UIImage(named: "Logo"))
        
        self.logInView!.logo?.contentMode = .Center
        self.signUpController?.signUpView!.logo?.contentMode = UIViewContentMode.Center
        
        
        if PFUser.currentUser() != nil{
            showChatOverview()
        }
        
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        showChatOverview()
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        signUpController.dismissViewControllerAnimated(true, completion: { () -> Void in
            self.showChatOverview()
        })
    }
    
    func showChatOverview(){
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let overViewVC = sb.instantiateViewControllerWithIdentifier("ChatOverviewVC") as! OverViewTableViewController
        
        overViewVC.navigationItem.setHidesBackButton(true, animated: false)
        
        self.navigationController?.pushViewController(overViewVC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
