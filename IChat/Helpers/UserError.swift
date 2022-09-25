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
    case canNotGetUserInfo
    case canNotUnwrapToMUser
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .photoNotExist:
            return NSLocalizedString("User didn't choose photo", comment: "")
        case .canNotGetUserInfo:
            return NSLocalizedString("Failed to load user information from the server", comment: "")
        case .canNotUnwrapToMUser:
            return NSLocalizedString("Can not convert MUser from User", comment: "")
        }
    }
}
