//
//  RegisterCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 22/04/22.
//

import Foundation
import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterESVC()
        
        viewController.onNextTap = { userVidewModel in
            //Salvar no aparelho user e e-mail
            self.saveKeyChain(viewModel: userVidewModel)
//            self.goProfile(userVidewModel: userVidewModel)
        }
        
        DispatchQueue.main.async {
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    
    private func goProfile(userVidewModel: UserViewModel) {
        let viewModel = CoordinatorViewModel()
        viewModel.userViewModel = userVidewModel
        
        let coordinator = RegisterPersonalDataCoordinator(navigationController: self.navigationController, coordinatorViewModel: viewModel)
        coordinator.start()
    }
    
//    private func erroRegister() {
//        self.navigationController.presentAlert(withTitle: "Erro", message: "Não foi possível salvar o usuário!")
//    }
    
    private func saveKeyChain(viewModel: UserViewModel) {
        let accessToken = viewModel.password
        let data = Data(accessToken.utf8)
        let result = KeychainHelper.standard.save(data, service: "br.com.mobilesapp.MeusGastos", account: viewModel.email)

        if result {
            self.goProfile(userVidewModel: viewModel)
        } else {
            self.navigationController.presentAlert(withTitle: "Error", message: "Erro ao gravar o usuário! Repita a operação.")
        }
    }
}
