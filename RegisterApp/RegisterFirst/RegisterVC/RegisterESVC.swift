//
//  ViewController.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 18/04/22.
//

import UIKit

class RegisterESVC: UIViewController {

    var onNextTap: ((_ userViewModel: UserViewModel) -> Void)?
    
    lazy var registerEsView: RegisterView = {
        let view = RegisterView()
        
        view.onNextTap = { userViewModel in
                self.onNextTap?(userViewModel)
        }
        view.onPasswordWrong = {
            let messageError = UIAlertController(title: "Senha fora do padrão", message: "A senha deve conter um caracter especial, uma letra maiuscula uma minuscula e um numero com no mínimo 6 digitos", preferredStyle: .alert)
            messageError.addAction(UIAlertAction(title: "OK", style: .default))
            self.navigationController?.present(messageError, animated: true)
        }
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.registerEsView
    }

}

