//
//  ImageDefault.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 27/04/22.
//

import Foundation
import UIKit

class ImageCheckDefault: UIImageView {
    
    init(image: String) {
        super.init(frame: .zero)
        initDefault(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(image: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(systemName: image)
        self.tintColor = .green
        self.contentMode = .scaleAspectFit
        self.isHidden = true
    }
    
}
