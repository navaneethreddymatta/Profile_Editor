//
//  DepartmentViewController.swift
//  InClass03
//
//  Created by student on 7/12/16.
//  Copyright (c) 2016 mnr_iOS. All rights reserved.
//

import UIKit

class DepartmentViewController: UIViewController {

    var currentUser:UserClass?
    
    @IBOutlet weak var deptField: UISegmentedControl!
    
    @IBAction func deptFieldChanged(sender: AnyObject) {
        dept = deptField.selectedSegmentIndex
    }
    var dept = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        dept = currentUser!.department!
        // Do any additional setup after loading the view.
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
