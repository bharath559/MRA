//
//  UserProfile.swift
//  MRA
//
//  Created by Bharath Kongara on 2/16/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import Foundation

class UserProfile: NSObject {
    
    var emailId:String
    var firstName:String
    var lastName:String
    
    static let sharedInstance = UserProfile(emailId: "",firstName: "",lastName: "")
    
    private init(emailId:String,firstName:String,lastName:String) {
        
        self.emailId = emailId
        self.firstName = firstName
        self.lastName = lastName
        
    }
    
}
