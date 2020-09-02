//
//  AnimationUtil.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

enum Animations: String {
    case splashANimation = "music"
    
    case splashBackground = "music_background"
    
    case loader = "loader"
    
    func getValue() -> String {
        
        return self.rawValue
    }
}
