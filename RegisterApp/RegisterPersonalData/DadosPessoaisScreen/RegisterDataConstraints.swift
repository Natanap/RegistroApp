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
            
            idadeLabel.topAnchor.constraint(equalTo: self.subLabel.bottomAnchor,constant: 5),
            idadeLabel.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
          
            idadeButton.topAnchor.constraint(equalTo: self.idadeLabel.bottomAnchor, constant: 5),
            idadeButton.leadingAnchor.constraint(equalTo: self.idadeLabel.leadingAnchor),
            idadeButton.widthAnchor.constraint(equalToConstant: 170),
            idadeButton.heightAnchor.constraint(equalToConstant: 40),
            
            genderLabel.topAnchor.constraint(equalTo: self.idadeLabel.topAnchor),
            genderLabel.leadingAnchor.constraint(equalTo: self.idadeButton.trailingAnchor, constant: 5),
            
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
            
            telLabel.topAnchor.constraint(equalTo: self.cpfTextField.bottomAnchor,constant: 10),
            telLabel.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            telLabel.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
            
            telTextField.topAnchor.constraint(equalTo: self.telLabel.bottomAnchor,constant: 10),
            telTextField.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            telTextField.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -40),
            nextButton.leadingAnchor.constraint(equalTo: self.registerLabel.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: self.genderTextField.trailingAnchor),
        ])
    }

}

