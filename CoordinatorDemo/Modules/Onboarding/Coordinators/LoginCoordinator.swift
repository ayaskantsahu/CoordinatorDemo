//
//  LoginCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController?
    weak var parentCoordinator: OnboardingCoordinator?
    
    init(navigationController: UINavigationController?, parentCoordinator: OnboardingCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        childCoordinators = []
    }
    
    func start() {
        let vc = LoginViewController(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func onLoginTapped() {
        parentCoordinator?.removeChildCoordinator(self)
        parentCoordinator?.onLoginComplete()
    }
    
    func goBack() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}
