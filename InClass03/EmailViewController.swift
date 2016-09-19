//
//  EmailViewController.swift
//  InClass03
//
//  Created by student on 7/12/16.
//  Copyright (c) 2016 mnr_iOS. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {
    
    var currentUser:UserClass?
    
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.text = currentUser?.email!
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if emailField.text == nil || emailField.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Email Cannot Be Empty", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            return false
        }
        currentUser?.email = emailField.text
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
