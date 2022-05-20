//
//  UserModel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    let user: String
    let email, password: String
    
    init() {
        id = 0
        user = String.empty
        email = String.empty
        password = String.empty
    }
    
    init(id: Int, user: String, email: String, password: String) {
        self.id = id
        self.user = user
        self.email = email
        self.password = password
    }
}
