//
//  LoginCoordinator.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 29/04/22.
// CPF TESTE -> 73534956184

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginVC()
        
        viewController.onTappedLoginregisterButton = {
            self.nextRegisterView()
        }
        
        viewController.onTappedLoginButton = { viewModel in
            // Buscar
            let data = KeychainHelper.standard.read(service: "br.com.mobilesapp.MeusGastos", account: viewModel.email)
            
            guard let data = data else {
                self.navigationController.presentAlert(withTitle: "Erro ao logar", message: "email ou senha não encontrado, verifique!")
                
                return
            }
            
            let accessToken = String(data: data, encoding: .utf8)!
            
            if viewModel.password != accessToken {
                self.navigationController.presentAlert(withTitle: "Erro ao logar", message: "email ou senha não encontrado, verifique!")
                
                return
            }
            
            self.startResume()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
    private func nextRegisterView() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
    func startResume() {
        let coordinator = TabBarCoordinator(navigationController: self.navigationController, coordinatorViewModel: CoordinatorViewModel())
        coordinator.start()
    }
}
