//
//  DadosSensiveisScreen.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 20/04/22.
//

import UIKit

class RegisterDataView: UIView {

    // MARK: Closures
    var onNextTaped: (()-> Void)?
    
    lazy var registerLabel = LabelDefault(text: "Tela de Registro")
    lazy var subLabel = LabelDefault(sub: "Dados pessoais")
    lazy var idadeLabel = LabelDefault(textlabel: "Idade:")
    lazy var idadeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        let optionClosure = {(action: UIAction) in
            print(action.title)
        }
        button.menu = UIMenu(children: [
            UIAction(title: "Selecione a idade:", handler: optionClosure),
            UIAction(title: "0..15",handler: optionClosure),
            UIAction(title: "16..25",handler: optionClosure),
            UIAction(title: "26..35",handler: optionClosure),
            UIAction(title: "36..50",handler: optionClosure),
            UIAction(title: "Maior que 50..",handler: optionClosure),
        ])
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        
        return button
    }()
    
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
    
    lazy var validCpfImage = ImageCheckDefault(image: "checkmark.circle.fill")
    
    lazy var telLabel = LabelDefault(textlabel: "Telefone:")
    
    lazy var telTextField:  TextFieldDefault = {
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
        self.addSubview(idadeLabel)
        self.addSubview(idadeButton)
        self.addSubview(genderLabel)
        self.addSubview(genderTextField)
        self.addSubview(cpfLabel)
        self.addSubview(cpfTextField)
        self.addSubview(validCpfImage)
        self.addSubview(telLabel)
        self.addSubview(telTextField)
        self.addSubview(nextButton)
    }
    
    
    private func setPickerView() {

        genderPickerView.dataSource = self
        genderPickerView.delegate = self
        genderTextField.inputView = genderPickerView
        genderTextField.inputAccessoryView = genderPickerView.toolbar
    }
    
    @objc private func nextButtonTap(){
        onNextTaped?()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTextFields() {
        cpfTextField.delegate = self
        telTextField.delegate = self
    }
    
}


import SwiftUI
import UIViewCanvas

struct MyPreview: PreviewProvider {
    static var previews: some View {
        ViewCanvas(for: RegisterDataView())
    }
}
