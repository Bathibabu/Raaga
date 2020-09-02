//
//  ViewExtension.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    
    func setCornerRadius(radius: CGFloat) {
        
        self.cornerRadius = radius
        self.masksToBounds = true
    }
    
    func setBorderWithColor(borderWidth: CGFloat,borderColor: UIColor) {
        
        self.borderWidth = borderWidth
        self.borderColor = borderColor.cgColor
    }
}
