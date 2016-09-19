//
//  PasswordViewController.swift
//  InClass03
//
//  Created by student on 7/12/16.
//  Copyright (c) 2016 mnr_iOS. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    var currentUser:UserClass?
    
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.text = currentUser?.password!
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if passwordField.text == nil || passwordField.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Password Cannot Be Empty", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            return false
        }
        currentUser?.password = passwordField.text
        return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC: AnyObject = segue.destinationViewController
        if let profileVC = destinationVC as? profileViewController {
            profileVC.userObject = currentUser
        }
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
