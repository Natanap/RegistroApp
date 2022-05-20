//
//  AddressView.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 25/04/22.
//

import UIKit

class AddressRegisterView: UIView {
    
    var onSaveProfile: ((_ addressViewModel: AddressViewModel) -> Void)?
    var cepViewModel = CEPViewModel()
    var loginModel = LoginModel()
    
    lazy var titleLabel = LabelDefault(text: "Registro")
    lazy var subTitleLabel = LabelDefault(sub: "Dados de Endereço")
    lazy var cepLabel = LabelDefault(textlabel: "CEP:")
    lazy var cepTextField: UITextField = {
        let tf = TextFieldDefault(placeholder: "Digite seu cep:")
        tf.keyboardType = .numberPad
        return tf
    }()
//    lazy var cepinvalidLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Cep Não localizado"
//        label.textColor = .red
//        label.font = UIFont.systemFont(ofSize: 15)
//        return label
//    }()
    
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
    lazy var ufLabel = LabelDefault(textlabel: "Estado:")
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
        button.addTarget(self, action: #selector(saveProfileTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orangeViewBackgroundColor
        addSubView()
        setUpConstraints()
        setTextFields()
    }
    
    func addSubView(){
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(cepLabel)
        addSubview(cepTextField)
        addSubview(buscaCEPButton)
//        contentView.addSubview(cepinvalidLabel)
        addSubview(streetLabel)
        addSubview(streetTextField)
        addSubview(numberLabel)
        addSubview(numberTextField)
        addSubview(districtLabel)
        addSubview(districtTextField)
        addSubview(cityLabel)
        addSubview(cityTextField)
        addSubview(ufLabel)
        addSubview(ufTextField)
        addSubview(nextButton)
        
    
    }

    @objc private func saveProfileTap(){
        
        let addressViewModel = AddressViewModel(cep: cepTextField.text ?? String.empty, endereco: streetTextField.text ?? String.empty, bairro: districtTextField.text ?? String.empty, complemento: numberTextField.text ?? String.empty , cidade: cityTextField.text ?? String.empty, uf: ufTextField.text ?? String.empty)
        
        onSaveProfile?(addressViewModel)
 
    }
    
    private func setTextFields() {
        cepTextField.delegate = self
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
        
//        if cepViewModel.resultado == "0" {
//            self.cepinvalidLabel.isHidden = true
//        }else{
//            self.cepinvalidLabel.isHidden = true
//        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
    
            cepLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 5),
            cepLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            cepLabel.heightAnchor.constraint(equalToConstant: 20),
            
            cepTextField.topAnchor.constraint(equalTo: cepLabel.bottomAnchor,constant: 5),
            cepTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            cepTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor, constant: -50),
            
            buscaCEPButton.topAnchor.constraint(equalTo: cepTextField.topAnchor),
            buscaCEPButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            buscaCEPButton.leadingAnchor.constraint(equalTo: cepTextField.trailingAnchor, constant: 5),

            
            streetLabel.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 5),
            streetLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            streetTextField.topAnchor.constraint(equalTo: streetLabel.bottomAnchor,constant: 10),
            streetTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            streetTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
          
            numberLabel.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 5),
            numberLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            numberTextField.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 10),
            numberTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            numberTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            
            districtLabel.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 5),
            districtLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            districtTextField.topAnchor.constraint(equalTo: districtLabel.bottomAnchor,constant: 10),
            districtTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            districtTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            
            
            
            cityLabel.topAnchor.constraint(equalTo: districtTextField.bottomAnchor, constant: 5),
            cityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
    
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant: 10),
            cityTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            cityTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            
            
            ufLabel.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 5),
            ufLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            ufTextField.topAnchor.constraint(equalTo: ufLabel.bottomAnchor,constant: 10),
            ufTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            ufTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            
            nextButton.topAnchor.constraint(equalTo: ufTextField.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
        ])
        
//        cepinvalidLabel.isHidden = false
    }
}
