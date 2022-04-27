//
//  Numeric+.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 27/04/22.
//

import UIKit

extension Numeric {
    var formattedWithSeparator: String {
        Formatter.withSeparator.string(for: self) ?? String.empty
    }
}
