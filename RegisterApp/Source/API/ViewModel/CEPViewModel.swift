//
//  CEPViewModel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 28/04/22.
//

import Foundation

struct CEPViewModel {
    private var model: CEPModel
    
    init() {
        self.model = CEPModel()
    }
    
    init(model: CEPModel) {
        self.model = model
    }
    
    var estado: String {
        model.uf.toEstado()
    }
    
    var cidade: String {
        model.cidade
    }
    
    var bairro: String {
        model.bairro
    }
    
    var logradouro: String {
        return "\(model.tipoLogradouro) \(model.logradouro)"
    }
    
    var resultado: String {
        model.resultado
    }
}
