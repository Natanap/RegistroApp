//
//  ProfileViewModel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 04/05/22.
//

import Foundation

struct ProfileViewModel {
    let model: ProfileModel
    
    init(withModel model: ProfileModel) {
        self.model = model
    }
    
    init(age: String, gender:String, cpf: String, phone: String) {
        self.model = ProfileModel(age: age, gender: gender, cpf: cpf,phone: phone)
    }
    
    var age: String {
        model.age
    }
}

