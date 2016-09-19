//
//  ViewController.swift
//  InClass03
//
//  Created by student on 7/12/16.
//  Copyright (c) 2016 mnr_iOS. All rights reserved.
//  Navaneeth Reddy Matta 800935534

import UIKit

var departments = ["CS","SIS","BIO"]

var selectedDepartment = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
   
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var userDepartment: UISegmentedControl!
    
    @IBAction func userDepartmentChanged(sender: UISegmentedControl) {
        selectedDepartment = userDepartment.selectedSegmentIndex
    }

    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        var name = userName.text
        var email = userEmail.text
        var password = userPassword.text
        var department = selectedDepartment
        
        if name != nil && name != "" && email != nil && email != "" && password != nil && password != "" {
            return true
        }
        let alert = UIAlertController(title: "Alert", message: "Enter Your Details", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
        return false
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC: AnyObject = segue.destinationViewController
        if let profileVC = destinationVC as? profileViewController {
            var userObject = UserClass(name: userName.text,email: userEmail.text, password: userPassword.text, department: selectedDepartment)
            profileVC.userObject = userObject
        }
    }
}

