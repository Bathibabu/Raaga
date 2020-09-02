//
//  AnimationViewCreator.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import Lottie

class AnimationViewCreator {
    
    static func getAnimateView(frame: CGRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height),animation: String,loopMode: LottieLoopMode = .loop) -> AnimationView? {
        
        let splashAnimationView = AnimationView(name: animation)
        splashAnimationView.loopMode = loopMode
        splashAnimationView.backgroundBehavior = .pauseAndRestore
        splashAnimationView.frame = frame
        return splashAnimationView
    }
    
    static func getFrame() -> CGRect {
        
        let screen = UIScreen.main.bounds
        return CGRect(x: screen.midX - 100, y: screen.midY - 100, width: 200, height: 200)
    }
}
