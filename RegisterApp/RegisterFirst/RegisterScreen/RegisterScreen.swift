//
//  RegisterESUiView.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 18/04/22.
//

import UIKit

class RegisterScreen: UIView {
    
    var onNextTap: (() -> Void)?
    var onPasswordWrong: (()->Void)?
    
    lazy var registerLabel = LabelDefault(text: "Tela de Registro")
    lazy var subLabel = LabelDefault(sub: "Dados de Login")
    lazy var usernameTextField = TextFieldDefault(placeholder: "Username")
    lazy var emailTextField = TextFieldDefault(placeholder:"Digite seu e-mail")
    lazy var passwordTextField = TextFieldDefault(placeholder: "Digite sua senha", isSecureTextEntry: true)
    lazy var nextButton: UIButtonDefault = {
        let bt = UIButtonDefault(setTitle: "Próximo")
        bt.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orangeViewBackgroundColor
        addSubview()
        setUpConstraints()
        setupTextFields()
        configButtonEnable(true) // mudar para falso para desabilitar
    }
    
    
    private func configButtonEnable(_ enable:Bool){
        //habilita o button
        if enable {
            self.nextButton.setTitleColor(.white, for: .normal)
            self.nextButton.isEnabled = true
        }else{
            self.nextButton.setTitleColor(.lightGray, for: .normal)
            self.nextButton.isEnabled = false
        }
        
    }
    
    private func setupTextFields() {
        self.passwordTextField.delegate = self
        self.passwordTextField.keyboardType = .default
        self.emailTextField.keyboardType = .emailAddress
    }
    
    @objc private func nextButtonTap(){
        if !RegExp.checkPasswordComplexity(password: self.passwordTextField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
            onPasswordWrong?()
        }
        
        onNextTap?()
    }
    
    func addSubview(){
        self.addSubview(registerLabel)
        self.addSubview(subLabel)
        self.addSubview(usernameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
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
            
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: self.usernameTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.usernameTextField.trailingAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
}

extension RegisterScreen: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
//        let email:String = self.emailTextField.text ?? ""
//        let user:String = self.usernameTextField.text ?? ""
//        let password:String = self.passwordTextField.text ?? ""
//        //Verifica se os campos estão vazios
//        if !email.isEmpty && !user.isEmpty && !password.isEmpty{
//            self.configButtonEnable(true)
//
//        }else{
//            self.configButtonEnable(false)
//        }
        
//        if emailTextField != nil {
//            emailTextField.layer.borderColor = UIColor.purple.cgColor
//        }else{
//            emailTextField.layer.borderColor = UIColor.green.cgColor
//        }
        
//        if textField == passwordTextField {
//            let t = RegExp.checkPasswordComplexity(password: textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true)
//
//            if t {
//                textField.layer.borderColor = UIColor.systemGray.cgColor
//            } else {
//
//                textField.layer.borderColor = UIColor.red.cgColor
//            }
//        }
        
        
    }
}
