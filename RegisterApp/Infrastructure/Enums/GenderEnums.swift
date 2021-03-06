//
//  GenderEnums.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 27/04/22.
//

import Foundation

enum Gender: String, CaseIterable {
    case male = "ð§ð»ââï¸ - Masculino"
    case female = "ð±ð¿ââï¸ - Feminino "
    case undefined = "â-NÃ£o especificado"

    static var asArray: [Gender] {return self.allCases}
    
    func asInt() -> Int {
            return Gender.asArray.firstIndex(of: self)!
    }
}
