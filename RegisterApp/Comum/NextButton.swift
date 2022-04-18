//
//  NextButton.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 18/04/22.
//

import Foundation
import UIKit

class NextButton: UIButton {
    init(setTitle: String){
        super.init(frame: .zero)
        initDefault(setTitle: setTitle)
        setConstraints()
    }
    
    
    private func initDefault(setTitle: String) {
        self.setTitle(setTitle, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.white, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 7.5
        self.backgroundColor = .systemGreen
    }
    
    private func setConstraints(){
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
