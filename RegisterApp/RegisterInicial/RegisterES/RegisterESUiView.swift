//
//  RegisterESUiView.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 18/04/22.
//

import UIKit

class RegisterESUiView: UIView {
    
    
    lazy var registerLabel = TituloSubLabel(text: "Tela de Registro")
    lazy var subLabel = TituloSubLabel(sub: "Dados de Login")
    lazy var usernameTextField = TextFieldDefault(placeholder: "Username")
    lazy var emailTextField = TextFieldDefault(placeholder:"Digite seu e-mail")
    lazy var passwordTextField = TextFieldDefault(placeholder: "Digite sua senha", isSecureTextEntry: true)
    lazy var passwordCTextField = TextFieldDefault(placeholder: "Digite sua senha", isSecureTextEntry: true)
    lazy var nextButton = NextButton(setTitle: "Next")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        addSubview()
        setUpConstraints()
    }
    
    func addSubview(){
        self.addSubview(registerLabel)
        self.addSubview(subLabel)
        self.addSubview(usernameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(passwordCTextField)
        self.addSubview(nextButton)
        
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            registerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            registerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            
            subLabel.topAnchor.constraint(equalTo: self.registerLabel.bottomAnchor,constant: 10),
            subLabel.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: self.subLabel.bottomAnchor,constant: 15),
            usernameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            usernameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: self.usernameTextField.bottomAnchor,constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: self.usernameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.usernameTextField.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: self.usernameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.usernameTextField.trailingAnchor),
            
            passwordCTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,constant: 15),
            passwordCTextField.leadingAnchor.constraint(equalTo: self.usernameTextField.leadingAnchor),
            passwordCTextField.trailingAnchor.constraint(equalTo: self.usernameTextField.trailingAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: self.usernameTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.usernameTextField.trailingAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
}
