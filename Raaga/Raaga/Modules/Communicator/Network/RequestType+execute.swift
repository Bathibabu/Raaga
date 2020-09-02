//
//  RequestType+execute.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

public extension RequestType {
    func execute (
        dispatcher: NetworkDispatcher = URLSessionNetworkDispatcher.instance,
        onSuccess: @escaping (ResponseType) -> Void,
        onError: @escaping (String) -> Void
        ) {
        dispatcher.dispatch(
            request: self.data,
            onSuccess: { (responseData: String) in
                do {

                    let jsonDecoder = JSONDecoder()
                    guard let data = responseData.data(using: .utf8) else {
                        onError(ConnError.somethingWentWrong.rawValue)
                        return
                    }
 
                    if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String:Any] {
                        
                        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])

                        let result = try jsonDecoder.decode(ResponseType.self, from: jsonData)
                        DispatchQueue.main.async {
                            onSuccess(result)
                        }
                    } else {
                        onError(ConnError.somethingWentWrong.rawValue)

                    }
                    
                } catch let error {
                    DispatchQueue.main.async {
                        onError(error.localizedDescription)
                    }
                }
        },
            onError: { (error: String) in
                DispatchQueue.main.async {
                    onError(error)
                }
        }
        )
    }
}
