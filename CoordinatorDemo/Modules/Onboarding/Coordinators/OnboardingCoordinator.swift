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
    weak var parentCoordinator: AppCoordinator?
    var navigationController: UINavigationController?
    var rootViewController: UIViewController?
    
    init(parentCoordinator: AppCoordinator, navigationController: UINavigationController?) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LandingViewController(coordinator: self)
        rootViewController = vc
        navigationController?.setViewControllers([vc], animated: true)
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
        parentCoordinator?.removeChildCoordinator(self)
        parentCoordinator?.onOnboardingComplete()
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
