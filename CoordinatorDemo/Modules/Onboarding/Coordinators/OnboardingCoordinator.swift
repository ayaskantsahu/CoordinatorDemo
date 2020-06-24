//
//  OnboardingCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/18/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import Foundation
import UIKit

class OnboardingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController?
    var rootViewController: UIViewController?
    
    func start() {
        let vc = LandingViewController(coordinator: self)
        rootViewController = vc
        navigationController = UINavigationController(rootViewController: vc)
    }
    
    func onLoginComplete() {
        navigateToTutorialScreen()
    }
    
    func onSignupComplete() {
        navigateToTutorialScreen()
    }
    
    private func navigateToTutorialScreen() {
        navigationController?.viewControllers = []
        let tutorialCoordinator = TutorialCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(tutorialCoordinator)
        tutorialCoordinator.start()
    }
    
    func onOnboardingComplete() {
        
    }
    
}

extension OnboardingCoordinator: LandingViewControllerDelegate {
    func onSigninTapped() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
    }
    
    func onSignupTapped() {
        let signupCoordinator = SignupCoordinator(navigationController: navigationController, parentCoordinator: self)
        addChildCoordinator(signupCoordinator)
        signupCoordinator.start()
    }
    
    
}
