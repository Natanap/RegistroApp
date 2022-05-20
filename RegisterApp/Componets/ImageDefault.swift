//
//  ImageDefault.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 27/04/22.
//

import Foundation
import UIKit

class ImageDefault: UIImageView {
    
    init(image: String, tintColor: UIColor) {
        super.init(frame: .zero)
        initDefault(image: image, tintColor: tintColor)
    }
    
    
    init(image: String,tintColor: UIColor, isHidden: Bool) {
        super.init(frame: .zero)
        initDefault(image: image, tintColor: tintColor)
        
        self.isHidden = isHidden
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(image: String, tintColor: UIColor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(systemName: image)
        self.tintColor = tintColor
        self.contentMode = .scaleAspectFit
        self.isHidden = isHidden
    }
    
}
