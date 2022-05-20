//
//  ResumeScreen.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 04/05/22.
//

import Foundation
import UIKit

class ResumeView: ViewDefault {
    //MARK: Closures
    var onGoHome: (() -> Void )?
    
    //MARK: Variables
    let coordinatorViewModel: CoordinatorViewModel
    
    //MARK: Elements View
    var labelUserName = LabelDefault(textlabel: String.empty)
    var labelEmail = LabelDefault(textlabel: String.empty)
    var labelAge = LabelDefault(textlabel: String.empty)
    var labelGender = LabelDefault(textlabel: String.empty)
    var labelPhone = LabelDefault(textlabel: String.empty)
    var labelCep = LabelDefault(textlabel: String.empty)
    var labelStreet = LabelDefault(textlabel: String.empty)
    var labelComplemento = LabelDefault(textlabel: String.empty)
    var labelDistrict = LabelDefault(textlabel: String.empty)
    var labelCity = LabelDefault(textlabel: String.empty)
    var labelEstado = LabelDefault(textlabel: String.empty)
    
    var buttonHome = UIButtonDefault(setTitle: "Home")
    
    init(withCoordinatorViewModel coordinatorViewModel: CoordinatorViewModel) {
        self.coordinatorViewModel = coordinatorViewModel
        super.init(frame: .zero)
        
        self.setElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementsView() {
        setValuesInElementsViews()
        
        setLabelAge()
        setButtonHome()
    }
    //MARK: Exibe elementos na tela de resumo
    
    private func setValuesInElementsViews() {
        labelUserName.text = "Nome: \(self.coordinatorViewModel.userViewModel?.user ?? String.empty)"
        labelEmail.text = "E-mail: \(self.coordinatorViewModel.userViewModel?.email ?? String.empty)"
        labelAge.text = "Idade: \(self.coordinatorViewModel.profileViewModel?.age ?? String.empty)"
        labelGender.text = "Genero: \(self.coordinatorViewModel.profileViewModel?.model.gender ?? String.empty)"
        labelPhone.text = "Telefone: \(self.coordinatorViewModel.profileViewModel?.model.phone ?? String.empty)"
        labelCep.text = "Cep: \(self.coordinatorViewModel.addressViewModel?.model.cep ?? String.empty)"
        labelStreet.text = "Endereço: \(self.coordinatorViewModel.addressViewModel?.model.endereco ?? String.empty)"
        labelComplemento.text = "Complemento: \(self.coordinatorViewModel.addressViewModel?.model.complemento ?? String.empty)"
        labelDistrict.text = "Bairro: \(self.coordinatorViewModel.addressViewModel?.model.bairro ?? String.empty)"
        labelCity.text = "Cidade: \(self.coordinatorViewModel.addressViewModel?.model.cidade ?? String.empty)"
        labelEstado.text = "Estado: \(self.coordinatorViewModel.addressViewModel?.model.uf ?? String.empty)"
    }
    
    private func setLabelAge() {
        self.addSubview(labelUserName)
        self.addSubview(labelEmail)
        self.addSubview(labelAge)
        self.addSubview(labelGender)
        self.addSubview(labelPhone)
        self.addSubview(labelCep)
        self.addSubview(labelStreet)
        self.addSubview(labelComplemento)
        self.addSubview(labelDistrict)
        self.addSubview(labelCity)
        self.addSubview(labelEstado)
        
        NSLayoutConstraint.activate([
            labelUserName.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            labelUserName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            labelUserName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
            labelEmail.topAnchor.constraint(equalTo: self.labelUserName .bottomAnchor, constant: 10),
            labelEmail.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelEmail.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            
            labelAge.topAnchor.constraint(equalTo: self.labelEmail .bottomAnchor, constant: 10),
            labelAge.leftAnchor.constraint(equalTo: self.labelUserName.leftAnchor),
            labelAge.rightAnchor.constraint(equalTo:  self.labelUserName.rightAnchor),
            
            labelGender.topAnchor.constraint(equalTo: self.labelAge .bottomAnchor, constant: 10),
            labelGender.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelGender.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            labelPhone.topAnchor.constraint(equalTo: self.labelGender .bottomAnchor, constant: 10),
            labelPhone.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelPhone.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            labelCep.topAnchor.constraint(equalTo: self.labelPhone .bottomAnchor, constant: 10),
            labelCep.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelCep.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            labelStreet.topAnchor.constraint(equalTo: self.labelCep .bottomAnchor, constant: 10),
            labelStreet.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelStreet.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            labelComplemento.topAnchor.constraint(equalTo: self.labelStreet .bottomAnchor, constant: 10),
            labelComplemento.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelComplemento.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            labelDistrict.topAnchor.constraint(equalTo: self.labelComplemento .bottomAnchor, constant: 10),
            labelDistrict.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelDistrict.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            labelCity.topAnchor.constraint(equalTo: self.labelDistrict .bottomAnchor, constant: 10),
            labelCity.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelCity.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
            
            labelEstado.topAnchor.constraint(equalTo: self.labelCity .bottomAnchor, constant: 10),
            labelEstado.leftAnchor.constraint(equalTo: self.labelAge.leftAnchor),
            labelEstado.rightAnchor.constraint(equalTo:  self.labelAge.rightAnchor),
        ])
    }
    
    private func setButtonHome() {
        self.addSubview(buttonHome)
        
        buttonHome.addTarget(self, action: #selector(buttonHomeTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonHome.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            buttonHome.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonHome.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
        ])
    }
    
    @objc
    func buttonHomeTap() {
        onGoHome?()
    }
}

