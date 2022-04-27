//
//  RegisterPersonalDataCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 22/04/22.
//

import Foundation
import UIKit

class RegisterPersonalDataCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = DadosPessoaisVC()
        viewController.onNextTaped = {
            self.nextView()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    private func nextView() {
        let coordinator = AddressCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
