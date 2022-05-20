//
//  LoginVC.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 29/04/22.
//

import UIKit

class LoginVC: UIViewController {
    // MARK: - Variáveis
    var onTappedLoginButton: ((_ userVideModel: UserViewModel)-> Void)?
    var onTappedLoginregisterButton: (()-> Void)?
    
    lazy var loginScreen: LoginView = {
        let view = LoginView()
        
        view.onTappedLoginButton = {userViewModel in
            self.onTappedLoginButton?(userViewModel)
        }
        view.onTappedLoginregisterButton = {
            self.onTappedLoginregisterButton?()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.loginScreen
        self.loginScreen.configTextFieldDelegate(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
}

// MARK: - Extension TEXTFIELDelegate

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen.validaTextFields()
    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
