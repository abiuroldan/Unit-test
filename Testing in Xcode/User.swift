//
//  User.swift
//  Testing in Xcode
//
//  Created by Abiú Roldán on 03/04/20.
//  Copyright © 2020 Elshad Karimov. All rights reserved.
//

import Foundation

class User {
    var email = ""
    var password = ""
    var yearOfBirth = ""
    var terms = false
    
//    init(email: String, password: String, yearOfBirth: String, terms: Bool) {
//        self.email = email
//        self.password = password
//    }
    
    public func checkForm() -> String? {
        guard email != "" else {
            return "Missing email"
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        guard emailPred.evaluate(with: email) else {
            return "Wrong email format"
        }
        
        guard password != "" else {
            return "Missing password"
        }
        
        
        let currentYear = Calendar.current.component(.year, from: Date())
        guard yearOfBirth != "" else {
            return "Missing year"
        }
        
        guard let yearOfBirth = Int(yearOfBirth) else {
            return "It's not a number"
        }
        
        let age = currentYear - yearOfBirth
        
        guard age > 18 else {
            return "Age must be over 18"
        }
        
        if age > 100 {
            return "You are too old to register"
        }
        
        guard terms else {
            return "You must accept terms and conditions"
        }
        
        return nil
    }
}
