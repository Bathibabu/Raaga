//
//  UrlSessionNetworkDispatcher.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

public enum ConnError: String {
    case invalidURL = "Invalid url"
    case noData  = "Response data nil"
    case somethingWentWrong = "Something went wrong,please try again later"
}

public struct URLSessionNetworkDispatcher: NetworkDispatcher {
    public static let instance = URLSessionNetworkDispatcher()
    private init() {}
    
    public func dispatch(request: RequestData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void) {
        guard let url = URL(string: request.path) else {
            onError(ConnError.invalidURL.rawValue)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
            if let params = request.params {
                urlRequest.httpBody = params
            }
        if let header = request.headers {
            
            urlRequest.allHTTPHeaderFields  = header
        }
        
        URLSession.shared.downloadTask(with: urlRequest) { (data, response, error) in
         
            if let error = error {
                onError(error.localizedDescription)
                return
            }
            
            guard let _data = data else {
                onError(ConnError.noData.rawValue)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
             
                    if let string = try? String(contentsOf: _data) {
                        
                        onSuccess(string)
                    }
                    
                }else {
                    
                    onError(ConnError.somethingWentWrong.rawValue)
                }
            }
        }.resume()
    }
}
