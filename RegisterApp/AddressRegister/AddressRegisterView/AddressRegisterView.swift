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
    lazy var cepLabel = LabelDefault(textlabel: "CEP:")
    lazy var cepTextField: UITextField = {
        let tf = TextFieldDefault(placeholder: "Digite seu cep:")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    lazy var buscaCEPButton: UIButtonDefault = {
        let bt = UIButtonDefault(setTitle: "🔍")
        bt.addTarget(self, action: #selector(buscaCEPButtonTAP), for: .touchUpInside)
        return bt
    }()
    lazy var streetLabel = LabelDefault(textlabel: "Endereço:")
    lazy var streetTextField = TextFieldDefault(placeholder: "Digite o seu Endereço: ")
    lazy var numberLabel = LabelDefault(textlabel: "Número ou S/N + Complemento:")
    lazy var numberTextField = TextFieldDefault(placeholder: "Digite o seu número ou S/N + Complemento:")
    lazy var districtLabel = LabelDefault(textlabel: "Bairro:")
    lazy var districtTextField = TextFieldDefault(placeholder: "Digite o seu Bairro:")
    lazy var cityLabel = LabelDefault(textlabel: "Cidade:")
    lazy var cityTextField = TextFieldDefault(placeholder: "Digite a sua Cidade:")
    lazy var ufLabel = LabelDefault(textlabel: "Cidade:")
    lazy var ufTextField = TextFieldDefault(placeholder: "Digite o Estado:")
//    lazy var stateButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .black
//        let optionClosure = {(action: UIAction) in
//            print(action.title)
//        }
//        let option = States.listStates
//        let buttons = option.map {
//            UIAction(title: $0 , handler: optionClosure)
//        }
//
//        button.menu = UIMenu(children: buttons)
//        button.showsMenuAsPrimaryAction = true
//        button.changesSelectionAsPrimaryAction = true
//        return button
//    }()
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
        self.addSubview(cepLabel)
        self.addSubview(cepTextField)
        self.addSubview(buscaCEPButton)
        self.addSubview(streetLabel)
        self.addSubview(streetTextField)
        self.addSubview(numberLabel)
        self.addSubview(numberTextField)
        self.addSubview(districtLabel)
        self.addSubview(districtTextField)
        self.addSubview(cityLabel)
        self.addSubview(cityTextField)
        self.addSubview(ufLabel)
        self.addSubview(ufTextField)
        self.addSubview(nextButton)
        
    
    }
    
    

    @objc private func nextButtonTap(){
        onNextTaped?()
    }
    
    @objc
    private func buscaCEPButtonTAP() {
        guard let cep = cepTextField.text else { return }

        let provider = CEPProvider()
        provider.getEndereco(withCEP: cep) { (model, error) in
            guard let model = model
            else {
                print("Deu erro na busca do cep: \(String(describing: error))")
                return
            }

            let viewModel = CEPViewModel(model: model)
            self.updateCamp(cepModel: viewModel)
            print(viewModel)
        }
        
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
            
            
            cepLabel.topAnchor.constraint(equalTo: self.subTitleLabel.bottomAnchor, constant: 5),
            cepLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            cepTextField.topAnchor.constraint(equalTo: self.cepLabel.bottomAnchor,constant: 5),
            cepTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            cepTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor, constant: -50),
            
            buscaCEPButton.topAnchor.constraint(equalTo: self.cepTextField.topAnchor),
            buscaCEPButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            buscaCEPButton.leadingAnchor.constraint(equalTo: self.cepTextField.trailingAnchor, constant: 5),
            
            streetLabel.topAnchor.constraint(equalTo: self.cepTextField.bottomAnchor, constant: 5),
            streetLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            streetTextField.topAnchor.constraint(equalTo: self.streetLabel.bottomAnchor,constant: 10),
            streetTextField.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            streetTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            numberLabel.topAnchor.constraint(equalTo: self.streetTextField.bottomAnchor, constant: 5),
            numberLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            numberTextField.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 10),
            numberTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            numberTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            
            districtLabel.topAnchor.constraint(equalTo: self.numberTextField.bottomAnchor, constant: 5),
            districtLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            districtTextField.topAnchor.constraint(equalTo: self.districtLabel.bottomAnchor,constant: 10),
            districtTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            districtTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            
            
            cityLabel.topAnchor.constraint(equalTo: self.districtTextField.bottomAnchor, constant: 5),
            cityLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor,constant: 10),
            cityTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            cityTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
            
            
            ufLabel.topAnchor.constraint(equalTo: self.cityTextField.bottomAnchor, constant: 5),
            ufLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            ufTextField.topAnchor.constraint(equalTo: self.ufLabel.bottomAnchor,constant: 10),
            ufTextField.leadingAnchor.constraint(equalTo: self.streetTextField.leadingAnchor),
            ufTextField.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
//            stateButton.topAnchor.constraint(equalTo: self.cityTextField.topAnchor),
//            stateButton.leadingAnchor.constraint(equalTo: self.cityTextField.trailingAnchor, constant: 10 ),
//            stateButton.trailingAnchor.constraint(equalTo: self.streetTextField.trailingAnchor),
//            stateButton.heightAnchor.constraint(equalToConstant: 50),
            
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
