//
//  AddressCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 26/04/22.
//

import Foundation
import UIKit

class AddressCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = AddressRegisterVC()
        viewController.onNextTaped = {
            self.nextView()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    private func nextView() {
        print("dados cadastrados")
//        let coordinator = RegisterPersonalDataCoordinator(navigationController: self.navigationController)
//        coordinator.start()
    }
}
