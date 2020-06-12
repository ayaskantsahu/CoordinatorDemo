//
//  BlueCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import Foundation
import UIKit

class BlueCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BlueViewController(coordinator: self)
        navigationController?.setViewControllers([vc], animated: true)
    }
}
