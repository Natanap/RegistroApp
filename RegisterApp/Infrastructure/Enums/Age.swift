//
//  Age.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import Foundation

enum Age: String, CaseIterable {
    case zero = "0..15"
    case sixteen = "16..25"
    case twentySix = "26..35"
    case ThirtySix = "36..50"
    case greaterFifty = "> 50"

    static var asArray: [Age] {return self.allCases}
    
    func asInt() -> Int {
            return Age.asArray.firstIndex(of: self)!
    }
}

