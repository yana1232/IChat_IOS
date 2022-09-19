//
//  AuthError.swift
//  IChat
//
//  Created by Яна Балковская on 19.09.22.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordNotMatched
    case unKnownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Mail format is not valid", comment: "")
        case .passwordNotMatched:
            return NSLocalizedString("Passwords don't match", comment: "")
        case .unKnownError:
            return NSLocalizedString("An unknown error occured", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        }
    }
}
