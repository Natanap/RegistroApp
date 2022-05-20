//
//  TabBarCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 10/05/22.
//

import Foundation

import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController,
         coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let tabBarController = HomeTabBarVC()
        let homecoordinator = HomeCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        
        let categoryCoordinator = CategoryCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        
        tabBarController.setViewControllers([homecoordinator.homeViewController,                                             categoryCoordinator.categoryViewController], animated: false)
        
        tabBarController.tabBar.backgroundColor = .white
        
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
}

