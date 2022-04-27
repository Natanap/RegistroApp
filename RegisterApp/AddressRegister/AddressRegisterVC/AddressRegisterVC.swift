//
//  AddressVC.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 25/04/22.
//

import UIKit

class AddressRegisterVC: UIViewController {

    var onNextTaped: (()-> Void)?
    
    lazy var addressRegister: AddressRegisterView = {
        let view = AddressRegisterView()
        
        view.onNextTaped = {
            self.onNextTaped?()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.addressRegister = AddressRegisterView()
        self.view = self.addressRegister
        
    }

}
