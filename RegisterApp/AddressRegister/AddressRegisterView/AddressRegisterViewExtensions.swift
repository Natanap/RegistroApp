//
//  AddressRegisterViewExtensions.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 28/04/22.
//

import UIKit

extension AddressRegisterView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField){
        cepTextField.text = String(textField.text!.prefix(8))
        
    }
    func updateCamp(cepModel: CEPViewModel){
        DispatchQueue.main.async {
//            self.districtTextField.text = cepModel.estado
            self.districtTextField.text = cepModel.bairro
            self.cityTextField.text = cepModel.cidade
            self.streetTextField.text = cepModel.logradouro
            self.ufTextField.text = cepModel.estado
            
        }
    }

}
