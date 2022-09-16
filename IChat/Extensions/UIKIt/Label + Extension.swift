//
//  Label + Extension.swift
//  IChat
//
//  Created by Яна Балковская on 4.09.22.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}

