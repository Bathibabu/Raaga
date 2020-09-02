//
//  SplashCoordinator.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import UIKit

class SplashCoordinator: Coordinator {
    
    weak var parentCoordinator: BaseCoordinator?
        
    var children = [Coordinator]()

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
    
        let vc = SplashViewController.instantiate()
        vc.splashCoordinator = self
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(vc, animated: true)
    }
}
