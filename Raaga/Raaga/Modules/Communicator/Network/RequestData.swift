//
//  RequestData.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

public struct RequestData {
    public let path: String
    public let method: HTTPMethod
    public var params: Data?
    public var headers: [String: String]?
    
    public init (
        path: String,
        method: HTTPMethod = .get,
        params: Data? = nil,
        headers: [String: String]? = nil
        ) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
}

public class Headers {
    
    public let jsonHeader = ["Content-Type":"application/json"]
}
