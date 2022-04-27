//
//  AddressView.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 25/04/22.
//

import UIKit

class AddressRegisterView: UIView {
    
    var onNextTaped: (()-> Void)?
    
    lazy var titleLabel = LabelDefault(text: "Registro")
    lazy var subTitleLabel = LabelDefault(sub: "Dados de Endereço")
    lazy var streetTextField = TextFieldDefault(placeholder: "Digite a sua rua: ")
    lazy var numberTextField = TextFieldDefault(placeholder: "Digite o seu número ou S/N:")
    lazy var districtTextField = TextFieldDefault(placeholder: "Digite o seu Bairro:")
    lazy var cepTextField = TextFieldDefault(placeholder: "Digite seu CEP:")
    lazy var cityTextField = TextFieldDefault(placeholder: "Digite a sua Cidade:")
    lazy var stateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        let optionClosure = {(action: UIAction) in
            print(action.title)
        }
        let option = States.listStates
        let buttons = option.map {
            UIAction(title: $0 , handler: optionClosure)
        }
    
        button.menu = UIMenu(children: buttons)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        return button
    }()
    lazy var nextButton: UIButtonDefault = {
        let button = UIButtonDefault(setTitle: "NEXT")
        button.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orangeViewBackgroundColor
        addSubView()
        setUpConstraints()
    }
    
    func addSubView(){
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(streetTextField)
        self.addSubview(numberTextField)
        self.addSubview(districtTextField)
        self.addSubview(cepTextField)
        self.addSubview(cityTextField)
        self.addSubview(stateButton)
        self.addSubview(nextButton)
    }
    

    @objc private func nextButtonTap(){
        onNextTaped?()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            
            subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            streetTextField.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor,constant: 10),
            streetTextField.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            streetTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            numberTextField.topAnchor.constraint(equalTo: self.streetTextField.bottomAnchor, constant: 10),
            numberTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            numberTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            
            districtTextField.topAnchor.constraint(equalTo: self.numberTextField.bottomAnchor,constant: 10),
            districtTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            districtTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            
            cepTextField.topAnchor.constraint(equalTo: self.districtTextField.bottomAnchor,constant: 10),
            cepTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            cepTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: self.cepTextField.bottomAnchor,constant: 10),
            cityTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            cityTextField.widthAnchor.constraint(equalToConstant: 200),
            
            stateButton.topAnchor.constraint(equalTo: self.cityTextField.topAnchor),
            stateButton.leadingAnchor.constraint(equalTo: self.cityTextField.trailingAnchor, constant: 10 ),
            stateButton.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            stateButton.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
        ])
    }
}

import SwiftUI
import UIViewCanvas

struct MyPreview2: PreviewProvider {
    static var previews: some View {
        ViewCanvas(for: AddressRegisterView())
    }
}
