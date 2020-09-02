//
//  AlbumPreviewViewModel.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

protocol AlbumPreviewProtocol {
    
    func getAlbumName() -> String
    func getAlbumType() -> String?
    func getAlbumReleseDate() -> String
    func getAlbumImage(completion: @escaping (UIImage) -> ())
}

import UIKit
import Kingfisher
import Foundation

class AlbumPreviewViewModel: AlbumPreviewProtocol {
    
    private var album: Album?
    
    init(info: Album?) {
        
        self.album = info
    }
    
    func getAlbumName() -> String {
        
        guard let tName = self.album?.trackName else { return "NA" }
        return tName
    }
    
    func getAlbumType() -> String? {
        
        guard let aType = self.album?.primaryGenreName else { return "NA" }
        return aType
    }
    
    func getAlbumReleseDate() -> String {
        
        guard let rDate = self.album?.releaseDate else { return "NA" }
        guard let releseDate = DateUtility().convertToDate(dateString: rDate , format: .dateTimeTimeZone) else { return "NA" }
        return DateUtility().convertToString(date: releseDate, dateformat: .monthDayYear)
    }
    
    func getAlbumImage(completion: @escaping (UIImage) -> ()) {

        guard let tImage = self.album?.artworkUrl100,let url = URL(string: tImage) else { return }
        KingfisherManager.shared.retrieveImage(with: url) { result in
            let image = try? result.get().image
            if let image = image {
                
                completion(image)
            }
        }
    }
}
