//
//  AddressViewModel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import Foundation

struct AddressViewModel {
    let model: AddressModel
    
    init(withModel model: AddressModel) {
        self.model = model
    }
    
    init(cep: String, endereco:String, bairro: String, complemento: String, cidade: String, uf: String){
        self.model = AddressModel(cep: cep, endereco: endereco, bairro: bairro, complemento: complemento, cidade: cidade, uf: uf)
    }
}
