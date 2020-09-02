//
//  ServiceConstants.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

enum Environment {
    
    case development
    case staging
    case production
    
    func baseURL() -> String {
        return "\(urlProtocol())://\(domain())\(route())"
    }
    
    func urlProtocol() -> String {
        switch self {
        case .production:
            return "https"
        default:
            return "http"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development, .staging, .production:
            return "itunes.apple.com"
        }
    }
    
    func route() -> String {
        return "/search?"
    }
    
}

extension Environment {
    func host() -> String {
        return "\(self.domain())"
    }
}


// MARK:- APIs
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL()

struct Path {
    
    var album: String { return "\(baseUrl)term=" }
    
    struct Album {
        
        var searchAlbum: (String) -> String = { albumName in
            return "\(baseUrl)term=\(String(albumName))"
        }
    }
}
