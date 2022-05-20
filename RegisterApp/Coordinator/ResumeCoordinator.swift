//
//  ResumeCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 04/05/22.
//

import UIKit

class ResumeCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController, coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let viewController = ResumeVC()
        viewController.setProfileViewModel(coordinatorViewModel: self.coordinatorViewModel)
        
        viewController.onGoHome = {
            let coo = HomeCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
            coo.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
