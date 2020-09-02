//
//  AlbumSearchViewController.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit

class AlbumSearchViewController: UIViewController,Storyboarded {

    weak var albumSearchCoordinator: AlbumsSearchCoordinator?

    var albumVM: AlbumsListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
