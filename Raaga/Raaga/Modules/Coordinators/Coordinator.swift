//
//  Coordinator.swift
//  Raaga
//
//  Created by Bathi Babu on 01/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var children: [Coordinator] { get set }

    var navigationController: UINavigationController { get set }
    
    func start()
}
