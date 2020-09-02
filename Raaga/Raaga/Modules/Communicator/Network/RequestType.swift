//
//  RequestType.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

public protocol RequestType {
    associatedtype ResponseType: Codable
    var data: RequestData { get }
}
