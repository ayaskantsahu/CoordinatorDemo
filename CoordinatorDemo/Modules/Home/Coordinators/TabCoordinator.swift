//
//  TabCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import Foundation
import UIKit

class TabCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        var controllers: [UIViewController] = []
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController(), parentCoordinator: self)
        homeCoordinator.start()
        homeCoordinator.navigationController?.tabBarItem = UITabBarItem(title: "Home", image: .checkmark, selectedImage: nil)
        addChildCoordinator(homeCoordinator)
        
        let searchCoordinator = SearchCoordinator(navigationController: UINavigationController(), parentCoordinator: self)
        searchCoordinator.start()
        searchCoordinator.navigationController?.tabBarItem = UITabBarItem(title: "Search", image: .actions, selectedImage: nil)
        addChildCoordinator(searchCoordinator)
        
        if let navController = homeCoordinator.navigationController {
            controllers.append(navController)
        }
        
        if let navController = searchCoordinator.navigationController {
            controllers.append(navController)
        }
        
        
        tabBarController?.setViewControllers(controllers, animated: true)
        tabBarController?.tabBar.isTranslucent = true
        tabBarController?.delegate = self
    }
    
}

extension TabCoordinator: UITabBarControllerDelegate {
    
}
