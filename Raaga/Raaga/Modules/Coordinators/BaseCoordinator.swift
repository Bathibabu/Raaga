//
//  BaseCoordinator.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import UIKit

class BaseCoordinator: NSObject,Coordinator {
        
    var navigationController: UINavigationController

    var children = [Coordinator]()

    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
    
        let splashCoordinator = SplashCoordinator(navigationController: self.navigationController)
        splashCoordinator.parentCoordinator = self
        children.append(splashCoordinator)
        splashCoordinator.start()
    }
    
    func albumListNavigation() {
    
        let albumListCoordinator = AlbumsListCoordinator(navigationController: self.navigationController)
        albumListCoordinator.parentCoordinator = self
        children.append(albumListCoordinator)
        albumListCoordinator.start()
    }
    
    func albumPreviewNavigation(album: Album) {
    
        let albumPreviewCoordinator = AlbumPreviewCoordinator(navigationController: self.navigationController)
        albumPreviewCoordinator.parentCoordinator = self
        albumPreviewCoordinator.album = album
        children.append(albumPreviewCoordinator)
        albumPreviewCoordinator.start()
    }
    
    func albumSearchNavigation() {
    
        let albumSearchCoordinator = AlbumsSearchCoordinator(navigationController: self.navigationController)
        albumSearchCoordinator.parentCoordinator = self
        children.append(albumSearchCoordinator)
        albumSearchCoordinator.start()
    }
}
