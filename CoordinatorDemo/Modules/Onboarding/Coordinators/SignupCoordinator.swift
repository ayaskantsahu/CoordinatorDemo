//
//  SignupCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

class SignupCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    weak var parentCoordinator: OnboardingCoordinator?
    
    init(navigationController: UINavigationController?, parentCoordinator: OnboardingCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = EmailRegistrationViewController(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToCodeScreen() {
        let vc = EnterCodeViewController(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SignupCoordinator: EmailRegistrationViewControllerDelegate {
    func goBack() {
        parentCoordinator?.removeChildCoordinator(self)
    }
    
    func onRegister() {
        // 1. Make API call to pass on info to server
        // The below logic should be run when results are returned
        navigateToCodeScreen()
    }
    
    
}

extension SignupCoordinator: EnterCodeViewControllerDelegate {
    func onVerify() {
        // 1. Make API call to pass on info to server
        // The below logic should be run when results are returned
        parentCoordinator?.removeChildCoordinator(self)
        parentCoordinator?.onSignupComplete()
    }
    
}
