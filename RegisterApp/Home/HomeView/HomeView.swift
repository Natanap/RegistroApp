//
//  HomeView.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import UIKit

class HomeView: UIView {

    lazy var navBar: NavBarView = {
        let navbar = NavBarView()
        navbar.translatesAutoresizingMaskIntoConstraints = false
        return navbar
    }()
    
    lazy var vectorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedVectorButton), for: .touchUpInside)
        return button
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmet = UISegmentedControl(items: ["Essa Semana", "Esse mês", "Todos"])
        segmet.translatesAutoresizingMaskIntoConstraints = false
        segmet.selectedSegmentIndex = 1
        segmet.backgroundColor = .systemGray2
        segmet.translatesAutoresizingMaskIntoConstraints = false
        return segmet
    }()
    
    lazy var inputsView: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Input)
        view.setValue(value: 111113500)
        view.layer.cornerRadius = 25
        return view
    }()

    lazy var outputsView: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Output)
        view.setValue(value: 562312)
        view.layer.cornerRadius = 25
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setUpConstraints()
    }
    
    @objc private func tappedVectorButton(){
        
    }
    
    private func addSubView(){
        self.addSubview(navBar)
        self.navBar.addSubview(vectorButton)
        self.addSubview(segmentedControl)
        self.addSubview(inputsView)
        self.addSubview(outputsView)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: self.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 140),
            
            vectorButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 56),
            vectorButton.widthAnchor.constraint(equalToConstant: 20),
            vectorButton.heightAnchor.constraint(equalToConstant: 20),
            vectorButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -21),
            
            segmentedControl.topAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: 2),
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            
            inputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 11),
            inputsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            inputsView.heightAnchor.constraint(equalToConstant: 124),
            inputsView.widthAnchor.constraint(equalToConstant: 171),
            
            outputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 11),
            outputsView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
            outputsView.heightAnchor.constraint(equalToConstant: 124),
            outputsView.widthAnchor.constraint(equalToConstant: 171),
            
            
        ])}
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}
