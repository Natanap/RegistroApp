//
//  LoginScreen.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 29/04/22.
//

import UIKit

class LoginScreen: UIView {

    var onTappedLoginButton: ((_ userViewModel: UserViewModel)-> Void)?
    var onTappedLoginregisterButton: (()-> Void)?
    
    lazy var imageLogin: ImageDefault = {
        let image = ImageDefault(image:"person.circle",tintColor: .black, isHidden: false)
        image.backgroundColor = .orangeViewBackgroundColor
        return image
    }()
    
    lazy var imageUser: ImageDefault =  {
        let image = ImageDefault(image:"person.fill",tintColor: .black, isHidden: false)
        image.backgroundColor = .orangeViewBackgroundColor
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1.0
        return image
    }()
    lazy var emailTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Digite seu e-mail:")
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 0
        return tf
    }()
    
    lazy var passwordImage: ImageDefault =  {
        let image = ImageDefault(image:"lock",tintColor: .black, isHidden: false)
        image.backgroundColor = .orangeViewBackgroundColor
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1.0
        return image
    }()
    
    lazy var passwordTextField: TextFieldDefault = {
        let tf = TextFieldDefault(placeholder: "Digite sua senha:", isSecureTextEntry: true)
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 0
        return tf
    }()
    
    lazy var loginButton:UIButtonDefault = {
        let button = UIButtonDefault(setTitle: "Logar")

        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var alternativeLabel = LabelDefault(textlabel: "ou")
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastra-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        //Adicionado target para o button
        button.addTarget(self, action: #selector(tappedLoginregisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orangeViewBackgroundColor
        addSubview()
        setUpConstraints()
        self.configButtonEnable(false)
    }
    
    private func addSubview(){
        self.addSubview(imageLogin)
        self.addSubview(imageUser)
        self.addSubview(emailTextField)
        self.addSubview(passwordImage)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(alternativeLabel)
        self.addSubview(registerButton)
        
    }
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
        let userVidewModel = UserViewModel(model: UserModel(id: 0, user: String.empty , email: emailTextField.text ?? String.empty, password: passwordTextField.text ?? String.empty))
        onTappedLoginButton?(userVidewModel)
    }
    
    @objc private func tappedLoginregisterButton(){
        
        
        onTappedLoginregisterButton?()
    }
    
    public func getEmail()-> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword()-> String{
        return self.passwordTextField.text ?? ""
    }
    
    public func validaTextFields(){
        let email:String = self.emailTextField.text ?? ""
        let passaword:String = self.passwordTextField.text ?? ""
        
        //Verifica se os campos estão vazios
        if !email.isEmpty && !passaword.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }

    private func configButtonEnable(_ enable:Bool){
        //habilita o button
        if enable {
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else{
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([

            imageLogin.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageLogin.widthAnchor.constraint(equalToConstant: 150),
            imageLogin.heightAnchor.constraint(equalToConstant:  150),
            
            imageUser.topAnchor.constraint(equalTo: self.imageLogin.bottomAnchor, constant: 10),
            imageUser.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageUser.widthAnchor.constraint(equalToConstant: 50),
            imageUser.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor, constant: 2.5),
            
            emailTextField.topAnchor.constraint(equalTo: self.imageUser.topAnchor, constant: 1.5),
            emailTextField.leadingAnchor.constraint(equalTo: self.imageUser.trailingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
    
            passwordImage.topAnchor.constraint(equalTo: self.imageUser.bottomAnchor, constant: 10),
            passwordImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            passwordImage.widthAnchor.constraint(equalToConstant: 50),
            passwordImage.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor, constant: 2),
            
            passwordTextField.topAnchor.constraint(equalTo: self.passwordImage.topAnchor, constant: 1),
            passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            
            
            loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            
            alternativeLabel.centerXAnchor.constraint(equalTo: self.loginButton.centerXAnchor),
            alternativeLabel.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor,constant: 10),
            
            registerButton.topAnchor.constraint(equalTo: self.alternativeLabel.bottomAnchor,constant: 10),
            registerButton.centerXAnchor.constraint(equalTo: self.loginButton.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 250),
            registerButton.heightAnchor.constraint(equalToConstant: 30),
        
        ])}
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
