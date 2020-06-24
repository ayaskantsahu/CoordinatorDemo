//
//  TabCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import Foundation
import UIKit

/**
 Retaining as this will be useful later for home page.
 */
//class TabCoordinator: NSObject, Coordinator {
//    var childCoordinators: [Coordinator] = []
//    var navigationController: UINavigationController?
//    var tabBarController: UITabBarController?
//    
//    override init() {
//        self.tabBarController = UITabBarController()
//    }
//    
//    func start() {
//        var controllers: [UIViewController] = []
//        let redCoordinator = RedCoordinator(navigationController: UINavigationController())
//        redCoordinator.start()
//        redCoordinator.navigationController?.tabBarItem = UITabBarItem(title: "Red", image: .actions, selectedImage: nil)
//        childCoordinators.append(redCoordinator)
//        
//        let blueCoordinator = BlueCoordinator(navigationController: UINavigationController())
//        blueCoordinator.start()
//        blueCoordinator.navigationController?.tabBarItem = UITabBarItem(title: "Blue", image: .checkmark, selectedImage: nil)
//        childCoordinators.append(blueCoordinator)
//        
//        if let navController = redCoordinator.navigationController {
//            controllers.append(navController)
//        }
//        
//        if let navController = blueCoordinator.navigationController {
//            controllers.append(navController)
//        }
//        
//        
//        tabBarController?.setViewControllers(controllers, animated: true)
//        tabBarController?.tabBar.isTranslucent = true
//        tabBarController?.delegate = self
//    }
//    
//}
//
//extension TabCoordinator: UITabBarControllerDelegate {
//    
//}
