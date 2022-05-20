//
//  AddressCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 26/04/22.
//

import Foundation
import UIKit

class AddressCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController, coordinatorViewModel: CoordinatorViewModel){
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let viewController = AddressRegisterVC()

        viewController.onSaveProfile = { addressViewModel in
            self.coordinatorViewModel.addressViewModel = addressViewModel
            self.startResumeCoordinator()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
        
//        viewController.onNextTaped = {
//            viewController.onSaveProfile = { profileViewModel in
//                self.startResumeCoordinator(profileViewModel: profileViewModel)
//            }
//            self.nextView()
//        }
//        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startResumeCoordinator() {
        let coordinator = ResumeCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        
        coordinator.start()
    }
//    private func nextView() {
//        print("dados cadastrados")
//        let coordinator = ResumeCoordinator(navigationController: self.navigationController, profileViewModel: profileViewModel)
//        coordinator.start()
//    }
}
