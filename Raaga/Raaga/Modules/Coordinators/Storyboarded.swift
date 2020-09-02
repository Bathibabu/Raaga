//
//  Storyboarded.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import UIKit


protocol Storyboarded {
    
    static func instantiate() -> Self
}


extension Storyboarded  where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
