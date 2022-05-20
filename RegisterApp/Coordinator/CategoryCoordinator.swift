//
//  CategoryCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 10/05/22.
//

import UIKit

class CategoryCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    let categoryViewController: CategoryVC = {
        let view = CategoryVC()
        view.tabBarItem.image = UIImage(systemName: "slider.horizontal.3")
        
        return view
    }()
    
    init(navigationController: UINavigationController,
         coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        //self.navigationController.pushViewController(viewController, animated: true)
    }
}
