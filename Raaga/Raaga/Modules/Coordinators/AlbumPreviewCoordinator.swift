//
//  AlbumPreviewCoordinator.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import UIKit

class AlbumPreviewCoordinator: Coordinator {
    
    weak var parentCoordinator: BaseCoordinator?
    
    var children = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var album: Album?
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
    
        let vc = AlbumDetailViewController.instantiate()
        vc.albumPreviewCoordinator = self
        vc.previewVM = AlbumPreviewViewModel(info: album)
        navigationController.isNavigationBarHidden = false
        self.navigationController.pushViewController(vc, animated: true)
    }
}
