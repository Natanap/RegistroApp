//
//  AddressModel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import Foundation

struct AddressModel {
    let cep: String
    let endereco: String
    let bairro: String
    let complemento: String
    let cidade: String
    let uf: String
    
    
    init() {
        self.cep = String.empty
        self.endereco = String.empty
        self.bairro = String.empty
        self.complemento = String.empty
        self.cidade = String.empty
        self.uf = String.empty
    }
    
    init(cep: String, endereco:String, bairro: String, complemento: String, cidade: String, uf: String) {
        self.cep = cep
        self.endereco = endereco
        self.bairro = bairro
        self.complemento = complemento
        self.cidade = cidade
        self.uf = uf
    }
}
