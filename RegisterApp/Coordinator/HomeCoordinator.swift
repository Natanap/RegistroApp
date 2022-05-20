//
//  HomeCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    let homeViewController: HomeVc = {
        let view = HomeVc()
        view.tabBarItem.image = UIImage(systemName: "banknote")
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
