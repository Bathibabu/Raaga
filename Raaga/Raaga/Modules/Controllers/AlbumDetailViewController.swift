//
//  AlbumDetailViewController.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController,Storyboarded {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLbl: UILabel!
    @IBOutlet weak var albumTypeLbl: UILabel!
    @IBOutlet weak var updatedDateLbl: UILabel!
    
    var albumPreviewCoordinator: AlbumPreviewCoordinator?
    var previewVM: AlbumPreviewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    func setUpUI() {
        
        albumTitleLbl.text = previewVM?.getAlbumName()
        albumTypeLbl.text = previewVM?.getAlbumType()
        updatedDateLbl.text = previewVM?.getAlbumReleseDate()
        previewVM?.getAlbumImage(completion: { [weak self] (image) in
            
            self?.albumImageView.image = image
        })
    }
    @IBAction func addAlbum(_ sender: Any) {

        
    }
    
    @IBAction func removeAlbum(_ sender: Any) {
        
        
    }
}
