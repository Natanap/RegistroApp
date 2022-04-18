//
//  TituloSubLabel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 18/04/22.
//

import Foundation
import UIKit

class TituloSubLabel: UILabel{
    
    init(text: String){
        super.init(frame: .zero)
        initDefault(text: text)
    }
    
    init(sub:String){
        super.init(frame: .zero)
        initDefault2(sub: sub)
        self.font = UIFont.systemFont(ofSize: 19)
    }
    
    private func initDefault(text: String) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .white
        self.font = UIFont.boldSystemFont(ofSize: 23)
       
    }
    
    private func initDefault2(sub: String) {
        self.text = sub
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .white
        self.font = UIFont.boldSystemFont(ofSize: 19)
       
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
