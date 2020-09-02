//
//  SplashViewController.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController,Storyboarded {

    weak var splashCoordinator: SplashCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        guard let dancingMusicView = AnimationViewCreator.getAnimateView(animation: Animations.splashANimation.getValue()) else { return }
        self.view.addSubview(dancingMusicView)
        dancingMusicView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            
            self.splashCoordinator?.parentCoordinator?.albumListNavigation()
        }
    }
}
