//
//  RegisterCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 22/04/22.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterESVC()
        viewController.onNextTap = {
            self.nextView()
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func nextView() {
        let coordinator = RegisterPersonalDataCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
}
