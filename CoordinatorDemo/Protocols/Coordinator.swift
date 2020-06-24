//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    
    /** Any child coordinators to keep track of, to prevent them from getting deallocated in memory. */
    var childCoordinators: [Coordinator] { get set }
    
    /** This will allow access to navigation controller for a given flow */
    var navigationController: UINavigationController? { get set }
    
    /** Used for handling startup tasks - think of it as the `viewDidLoad()` of coordinators. */
    func start()
    
}

public extension Coordinator {
    
    /**
     Adds a child coordinator to the parent, preventing it from getting deallocated in memory.
     
     - Parameter childCoordinator: The coordinator to keep allocated in memory.
     */
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    /**
     Removes a child coordinator from its parent, releasing it from memory.
     
     - Parameter childCoordinator: The coordinator to release.
     */

    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
    
}

