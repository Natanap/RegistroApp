//
//  Formatter.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 27/04/22.
//

import UIKit

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        
        return formatter
    }()
}
