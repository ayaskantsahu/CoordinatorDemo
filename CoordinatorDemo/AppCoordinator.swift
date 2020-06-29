//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/29/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.childCoordinators = []
        self.navigationController = navigationController
    }
    
    func start() {
        let onboardingCoordinator = OnboardingCoordinator(parentCoordinator: self, navigationController: navigationController)
        onboardingCoordinator.start()
        addChildCoordinator(onboardingCoordinator)
    }
    
    func onOnboardingComplete() {
        let tabBarController = UITabBarController()
        navigationController?.viewControllers = [tabBarController]
        let tabCoordinator = TabCoordinator(tabBarController: tabBarController)
        tabCoordinator.start()
        addChildCoordinator(tabCoordinator)
    }
    
    
}
