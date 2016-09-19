//
//  UserObj.swift
//  InClass03
//
//  Created by student on 7/12/16.
//  Copyright (c) 2016 mnr_iOS. All rights reserved.
//

import Foundation

class UserClass {
    
    var name:String?
    var email:String?
    
    var password:String?
    
    var department:Int?
    
    init(name: String, email:String, password:String, department:Int) {
        self.name = name
        self.email = email
        self.password = password
        self.department = department
    }
}