//
//  DadosSensiveisScreen.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 20/04/22.
//

import UIKit

class RegisterDataView: UIView {

    // MARK: Closures
    var onNextTaped: ((_ profileViewModel: ProfileViewModel)-> Void)?
    
    lazy var registerLabel = LabelDefault(text: "Tela de Registro")
    lazy var subLabel = LabelDefault(sub: "Dados pessoais")
    lazy var ageLabel = LabelDefault(textlabel: "Idade:")
    lazy var ageTextField = TextFieldDefault(placeholder: "Sua idade")
    lazy var agePickerView:ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapDone = { [weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: false)
            self.ageTextField.text = Age.allCases[row].rawValue
            self.ageTextField.resignFirstResponder()
        }
        
        picker.didTapCancel = {
            self.ageTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
//    lazy var idadeButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .black
//        let optionClosure = {(action: UIAction) in
//            print(action.title)
//        }
//        button.menu = UIMenu(children: [
//            UIAction(title: "Selecione a idade:", handler: optionClosure),
//            UIAction(title: "0..15",handler: optionClosure),
//            UIAction(title: "16..25",handler: optionClosure),
//            UIAction(title: "26..35",handler: optionClosure),
//            UIAction(title: "36..50",handler: optionClosure),
//            UIAction(title: "Maior que 50..",handler: optionClosure),
//        ])
//        button.showsMenuAsPrimaryAction = true
//        button.changesSelectionAsPrimaryAction = true
//        button.addTarget(self, action: #selector(ageSelect), for: .touchUpInside)
//        return button
//    }()
//
    lazy var genderLabel = LabelDefault(textlabel: "Gênero")
    lazy var genderTextField = TextFieldDefault(placeholder: "Seu gênero")
    lazy var genderPickerView: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapDone = { [weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: false)
            self.genderTextField.text = Gender.allCases[row].rawValue
            self.genderTextField.resignFirstResponder()
        }
        
        picker.didTapCancel = {
            self.genderTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
    lazy var cpfLabel = LabelDefault(textlabel: "CPF:")
    
    lazy var cpfTextField: TextFieldDefault = {
        let text = TextFieldDefault(placeholder: "Digite o seu CPF")
        text.keyboardType = .asciiCapableNumberPad
        return text
    }()
    
    lazy var validCpfImage = ImageDefault(image: "checkmark.circle.fill", tintColor: .green, isHidden: true)
    
    lazy var phoneLabel = LabelDefault(textlabel: "Telefone:")
    
    lazy var phoneTextField:  TextFieldDefault = {
        let text = TextFieldDefault(placeholder: "Digite o seu telefone")
        text.keyboardType = .asciiCapableNumberPad
        return text
    }()
    
    lazy var nextButton: UIButtonDefault = {
        let bt = UIButtonDefault(setTitle: "Próximo")
        bt.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orangeViewBackgroundColor
        addSubview()
        setPickerView()
        setTextFields()
        setUpConstraints()
        
    }
    
    func addSubview(){
        self.addSubview(registerLabel)
        self.addSubview(subLabel)
        self.addSubview(ageLabel)
        self.addSubview(ageTextField)
        self.addSubview(genderLabel)
        self.addSubview(genderTextField)
        self.addSubview(cpfLabel)
        self.addSubview(cpfTextField)
        self.addSubview(validCpfImage)
        self.addSubview(phoneLabel)
        self.addSubview(phoneTextField)
        self.addSubview(nextButton)
    }
    
    
    private func setPickerView() {

        agePickerView.dataSource = self
        agePickerView.delegate = self
        ageTextField.inputView = agePickerView
        ageTextField.inputAccessoryView = agePickerView.toolbar
        
        genderPickerView.dataSource = self
        genderPickerView.delegate = self
        genderTextField.inputView = genderPickerView
        genderTextField.inputAccessoryView = genderPickerView.toolbar
    }
    
   
    
    @objc private func nextButtonTap(){
        let age = ageTextField.text ?? String.empty
        let gender = genderTextField.text ?? String.empty
        let cpf = cpfTextField.text ?? String.empty
        let phone = phoneTextField.text ?? String.empty
        
        let profileViewModel = ProfileViewModel(age: age,
                                                gender: gender,
                                                cpf: cpf,
                                                phone: phone)
        
        onNextTaped?(profileViewModel)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTextFields() {
        cpfTextField.delegate = self
        phoneTextField.delegate = self
    }
    
}

