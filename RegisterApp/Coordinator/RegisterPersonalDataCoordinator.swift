//
//  RegisterPersonalDataCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 22/04/22.
//

import Foundation
import UIKit

class RegisterPersonalDataCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController, coordinatorViewModel: CoordinatorViewModel){
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let viewController = RegisterPersonalVC()
        viewController.onNextTaped = {profileViewModel in
            self.coordinatorViewModel.profileViewModel = profileViewModel
            self.startAddressCoordinator()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    private func startAddressCoordinator() {
        let coordinator = AddressCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        coordinator.start()
    }
}
