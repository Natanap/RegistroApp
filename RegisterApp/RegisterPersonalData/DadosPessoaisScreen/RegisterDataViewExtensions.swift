//
//  RegisterDataViewExtensions.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 27/04/22.
//

import UIKit

extension RegisterDataView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == cpfTextField {
            
            if (textField.text?.count ?? 0) < 14 {
                textField.layer.borderColor = UIColor.purple.cgColor
                if validCpfImage.isHidden == false{
                    validCpfImage.isHidden = true
                }
            } else if textField.text?.isValidCPF ?? false {
                textField.layer.borderColor = UIColor.green.cgColor
                if validCpfImage.isHidden == true{
                    validCpfImage.isHidden = false
                }
            }
            
            textField.text = String(textField.text!.prefix(14))
        }
        
        if textField == telTextField {
            
            if (textField.text?.count ?? 0) < 14 {
                textField.layer.borderColor = UIColor.purple.cgColor
            } else if (textField.text?.count ?? 0) == 14{
                textField.layer.borderColor = UIColor.green.cgColor
            }
            
            textField.text = String(textField.text!.prefix(14))
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if textField == cpfTextField {
                if !string.isBackspace {
                    if range.location == 3 || range.location == 7 {
                        textField.text = textField.text! + "."
                    } else if range.location == 11 {
                        textField.text = textField.text! + "-"
                        if validCpfImage.isHidden == false{
                            validCpfImage.isHidden = true
                        }else{
                            validCpfImage.isHidden = true
                        }
                    }
                }
            }
        if textField == telTextField {
            if !string.isBackspace {
                if range.location == 0 {
                    textField.text = textField.text! + "("
                }
                if range.location == 3 {
                    textField.text = textField.text! + ")"
                }else if range.location == 9 {
                    textField.text = textField.text! + "-"
                }
            }
        }

            return true
        }
    
    
}

extension RegisterDataView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        if pickerView == genderPickerView {
            return Gender.asArray.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == genderPickerView {
            return Gender.allCases[row].rawValue
        }
        
        return String.empty
    }
}
