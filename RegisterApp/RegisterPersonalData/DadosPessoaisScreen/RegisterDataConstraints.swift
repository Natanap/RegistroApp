//
//  RegisterDataConstraints.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 27/04/22.
//

import UIKit

extension RegisterDataView {
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            registerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            registerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
    
            subLabel.topAnchor.constraint(equalTo: self.registerLabel.bottomAnchor, constant: 5),
            subLabel.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: self.subLabel.bottomAnchor,constant: 5),
            ageLabel.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
          
            ageTextField.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor, constant: 5),
            ageTextField.leadingAnchor.constraint(equalTo: self.ageLabel.leadingAnchor),
            ageTextField.widthAnchor.constraint(equalToConstant: 170),
            ageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            genderLabel.topAnchor.constraint(equalTo: self.ageLabel.topAnchor),
            genderLabel.leadingAnchor.constraint(equalTo: self.ageTextField.trailingAnchor, constant: 5),
            
            genderTextField.topAnchor.constraint(equalTo: self.genderLabel.bottomAnchor,constant: 5),
            genderTextField.leadingAnchor.constraint(equalTo: self.genderLabel.leadingAnchor),
            genderTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            genderTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cpfLabel.topAnchor.constraint(equalTo: self.genderTextField.bottomAnchor, constant: 10),
            cpfLabel.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            cpfLabel.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
            
            cpfTextField.topAnchor.constraint(equalTo: self.cpfLabel.bottomAnchor, constant: 5),
            cpfTextField.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            cpfTextField.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
            
            validCpfImage.topAnchor.constraint(equalTo: self.cpfTextField.topAnchor, constant: 10),
            validCpfImage.trailingAnchor.constraint(equalTo: self.cpfTextField.trailingAnchor, constant: -10),
            validCpfImage.heightAnchor.constraint(equalToConstant: 25),
            validCpfImage.widthAnchor.constraint(equalToConstant: 25),
            
            phoneLabel.topAnchor.constraint(equalTo: self.cpfTextField.bottomAnchor,constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
            
            phoneTextField.topAnchor.constraint(equalTo: self.phoneLabel.bottomAnchor,constant: 10),
            phoneTextField.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
        ])
    }

}

