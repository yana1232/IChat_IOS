//
//  UserError.swift
//  IChat
//
//  Created by Яна Балковская on 19.09.22.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .photoNotExist:
            return NSLocalizedString("User didn't choose photo", comment: "")
        }
    }
}
