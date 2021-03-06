//
//  AlbumsListCoordinator.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import UIKit

class AlbumsListCoordinator: Coordinator {
    
    weak var parentCoordinator: BaseCoordinator?
    
    var children = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
    
        let vc = AlbumsListViewController.instantiate()
        vc.albumsListCoordinator = self
        vc.albumVM = AlbumsListViewModel()
        navigationController.isNavigationBarHidden = false
        navigationController.setViewControllers([vc], animated: true)
    }
}

