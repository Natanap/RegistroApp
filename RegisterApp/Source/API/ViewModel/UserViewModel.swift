//
//  UserViewModel.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import Foundation

struct UserViewModel {
    var model: UserModel?
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var id : Int {
        self.model?.id ?? 0
    }
    
    var user : String{
        self.model?.user ?? String.empty
    }
    
    
    var email: String {
        self.model?.email ?? String.empty
    }
    
    var password: String {
        self.model?.password ?? String.empty
    }
    
    func send(completionHandler: @escaping UserAPICompletionHandler) {
        let parameters: [AnyHashable: Any] = ["body": ["UserModel": self.model]]
        let provider = UserProvider()
        provider.send(parameters: parameters, completionHandler: completionHandler)
    }
}
