//
//  TextFieldDefault.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 18/04/22.
//

import Foundation
import UIKit

class TextFieldDefault: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder)
    }
    
    init(placeholder: String, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder)
        
        self.isSecureTextEntry = isSecureTextEntry

    }
    
    private func initDefault(placeholder: String) {
        self.placeholder = placeholder
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 7.5
        self.textColor = .black
        setConstraints()
    }
    
    private func setConstraints(){
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
