//
//  CartSingleton.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

protocol CartProtocol {
    
    func addToCart(album: Album)
    
    func removeFromCart(album: Album)
    
    func getCartCount() -> Int
}

class CartSingleton: CartProtocol {
    
    static let shared = CartSingleton()
    
    var albums: [Album]?
    
    func addToCart(album: Album) {
    
        if let albumsInfo = albums {
            
            let existedAlbum = albumsInfo.filter { $0.trackID == album.trackID }
            if existedAlbum.count > 0 {
                
                guard let cartCount = existedAlbum.first?.cartValue else { return }
                existedAlbum.first?.cartValue = cartCount+1
            }else {
                albums?.append(album)
            }
        }else {
            
        }
    }
    
    func removeFromCart(album: Album) {
        
        if let albumsInfo = albums {
            
            let existedAlbum = albumsInfo.filter { $0.trackID == album.trackID }
            if existedAlbum.count > 0 {
                
                guard let cartCount = existedAlbum.first?.cartValue else { return }
                existedAlbum.first?.cartValue = cartCount-1
            }else {
                
                albums = albumsInfo.filter { $0.trackID != album.trackID }
            }
        }else {
            
        }
    }
    
    func getCartCount() -> Int {
        
        guard let albumsInfo = albums else { return 0 }

        var cartCount = 0
        for item in albumsInfo.enumerated() {
            
            guard let count = item.element.cartValue else { return cartCount }
            cartCount += count
        }
       return cartCount
    }
}
