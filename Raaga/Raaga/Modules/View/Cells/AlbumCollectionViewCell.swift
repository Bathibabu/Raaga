//
//  AlbumCollectionViewCell.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit
import Kingfisher
import Foundation

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumBaseView: UIView!
    private let cornerRadius: CGFloat = 10.0
    
    func configureWith(album: Album?) {
        
        self.albumBaseView.layer.setCornerRadius(radius: cornerRadius)
        self.albumBaseView.layer.setBorderWithColor(borderWidth: 1, borderColor: UIColor.lightGray)
        guard let albumInfo = album else { return }
        guard let albumImageString = albumInfo.artworkUrl100 else { return }
        guard let url = URL(string: albumImageString) else { return }
        self.albumImage.kf.setImage(with: url, placeholder: UIImage(named: "album_placeholder"), options: [.transition(.fade(0.2))])
    }
}
