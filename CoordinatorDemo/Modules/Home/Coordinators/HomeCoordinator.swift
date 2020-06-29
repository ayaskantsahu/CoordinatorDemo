//
//  HomeCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/25/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    weak var parentCoordinator: TabCoordinator?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, parentCoordinator: TabCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        childCoordinators = []
    }
    
    func start() {
        let vc = HomeViewController(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func onModal1Tapped() {
        //
    }
    
    func onModal2Tapped() {
        let vc = Modal2ViewController(coordinator: self)
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    
}

extension HomeCoordinator: Modal2ViewControllerDelegate {
    func onDismissed() {
        print("dismissed")
    }
    
    
}
