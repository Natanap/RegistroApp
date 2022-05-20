//
//  NabBarView.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 09/05/22.
//

import UIKit

class NabBarView: UIView {
    
    lazy var navBar: UIView = {
        let navbar = UIView()
        navbar.translatesAutoresizingMaskIntoConstraints = false
        navbar.backgroundColor = .white
        return navbar
    }()
    
    lazy var titleLabel = LabelDefault(text: "Meus Gastos")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setUpConstraints()
    }
    
    @objc private func teste(){
        
    }
    private func addSubView(){
        self.addSubview(navBar)
        self.navBar.addSubview(titleLabel)
        
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: self.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            
        ])
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }


}
