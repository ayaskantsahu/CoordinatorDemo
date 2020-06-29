//
//  SearchCoordinator.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/25/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

class SearchCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    weak var parentCoordinator: TabCoordinator?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, parentCoordinator: TabCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        childCoordinators = []
    }
    
    func start() {
        let vc = SearchViewController(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SearchCoordinator: SearchViewControllerDelegate {
    func onSearchTapped() {
        //
    }
}
