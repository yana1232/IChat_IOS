//
//  Validators.swift
//  IChat
//
//  Created by Яна Балковская on 19.09.22.
//

import Foundation

class Validators {
    
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let password = password,
        let email = email,
        let confirmPassword = confirmPassword,
        email != "",
        password != "",
        confirmPassword != ""
        else {
            return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
