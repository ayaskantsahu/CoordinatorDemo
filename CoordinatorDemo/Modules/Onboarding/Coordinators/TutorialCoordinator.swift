//
//  TutorialCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

class TutorialCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController?
    weak var parentCoordinator: OnboardingCoordinator?
    
    init(navigationController: UINavigationController?, parentCoordinator: OnboardingCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        childCoordinators = []
    }
    
    func start() {
        let vc = TutorialViewController(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension TutorialCoordinator: TutorialViewControllerDelegate {
    func onTutorialDone() {
        parentCoordinator?.removeChildCoordinator(self)
        navigationController?.popViewController(animated: true)
        parentCoordinator?.onOnboardingComplete()
    }
    
    
}
