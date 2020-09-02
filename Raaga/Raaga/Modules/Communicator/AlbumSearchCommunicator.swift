//
//  AlbumSearchCommunicator.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

struct AlbumSearchCommunicator : RequestType {
    
    typealias ResponseType = Albums
    var path: String
    
    var data: RequestData {
        return RequestData(path: path, method: .get, params: nil, headers: Headers().jsonHeader)
    }
    
    init(searchText: String) {
        
        path = Path.Album().searchAlbum((searchText.count > 0) ? searchText : "all")
    }
}
