//
//  LoginModel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 04/05/22.
//

import Foundation

struct LoginModel {
    let userName: String
    let email:String
    
    
    init(){
        self.userName = String.empty
        self.email = String.empty
    }
    
    init(userName: String, email: String){
        self.userName = userName
        self.email = email
    }
}
