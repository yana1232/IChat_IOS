//
//  SelfConfiguringCell.swift
//  IChat
//
//  Created by Яна Балковская on 5.09.22.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U:  Hashable>(with value: U)
}
