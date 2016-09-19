//
//  profileViewController.swift
//  InClass03
//
//  Created by student on 7/12/16.
//  Copyright (c) 2016 mnr_iOS. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    var userObject:UserClass?
    var departments = ["CS","SIS","BIO"]
    var tempPassword = "****"
    var isPasswordDisplayed = false
    

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func editUserName(sender: AnyObject) {
    }
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBAction func editUserEmail(sender: AnyObject) {
    }
    
    @IBOutlet weak var userPasswordLabel: UILabel!
    
    @IBAction func editUserPassword(sender: AnyObject) {
    }
    @IBOutlet weak var showUserPassw: UIButton!
    
    @IBAction func showUserPassword(sender: AnyObject) {
        if isPasswordDisplayed == true {
            userPasswordLabel.text = tempPassword
            isPasswordDisplayed = false
            showUserPassw.setTitle("Show", forState: UIControlState.Normal)
        } else {
            isPasswordDisplayed = true
            userPasswordLabel.text = userObject!.password
            showUserPassw.setTitle("Hide", forState: UIControlState.Normal)
        }
    }

    @IBOutlet weak var userDepartmentLabel: UILabel!
    
    @IBAction func editUserDepartment(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userObject = UserClass(name: name!,email: email!, password: password!, department: department!)
        userNameLabel.text = userObject!.name
        userEmailLabel.text = userObject!.email
        userPasswordLabel.text = tempPassword
        userDepartmentLabel.text = departments[userObject!.department!]
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC: AnyObject = segue.destinationViewController
        if let UserNameVC = destinationVC as? UserNameViewController {
            UserNameVC.currentUser = userObject
        } else if let EmailNameVC = destinationVC as? EmailViewController {
            EmailNameVC.currentUser = userObject
        } else if let PasswordVC = destinationVC as? PasswordViewController {
            PasswordVC.currentUser = userObject
        }
        else if let DepartmentVC = destinationVC as? DepartmentViewController {
            DepartmentVC.currentUser = userObject
        }
    }
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        if let userN = userObject?.name {
            userNameLabel.text = userObject!.name!
        }
        if let userE = userObject?.email {
            userEmailLabel.text = userObject!.email!
        }
        if let userD = userObject?.department {
            userDepartmentLabel.text = departments[userObject!.department!]
        }
        
    }

}
