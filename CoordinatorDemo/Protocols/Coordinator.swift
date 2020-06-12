//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    
    func start()
}
