//
//  NetworkDispatcher.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

public protocol NetworkDispatcher {
    func dispatch(request: RequestData, onSuccess: @escaping (String) -> Void, onError: @escaping (String) -> Void)
}
