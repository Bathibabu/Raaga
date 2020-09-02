//
//  AlbumsListViewModel.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

protocol AlbumListProtocol {
    
    func getAlbums(searchText: String,completionHandler: @escaping () -> ())
    
    func getNumberOfAlbums() -> Int
    
    func getAlbumWithIndex(index: IndexPath) -> Album?
    
}

class AlbumsListViewModel: AlbumListProtocol {
    
    private var albums: [Album]?
    
    func getAlbums(searchText: String,completionHandler: @escaping () -> ()) {
        
        AlbumSearchCommunicator(searchText: searchText.isEmpty ? "All" : searchText).execute(onSuccess: { [weak self] (info) in
            
            self?.albums = info.results
            completionHandler()
            
        }) { (error) in
            
            print(error)
        }
    }
    
    func getNumberOfAlbums() -> Int {
        
        return albums?.count ?? 0
    }
    
    func getAlbumWithIndex(index: IndexPath) -> Album? {
        
        return albums?[index.row]
    }
}
