//
//  AddressVC.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 25/04/22.
//

import UIKit

class AddressRegisterVC: UIViewController {

    var onSaveProfile: ((_ addressViewModel: AddressViewModel) -> Void)?
    
    lazy var addressRegister: AddressRegisterView = {
        let view = AddressRegisterView()

            view.onSaveProfile = { addressViewModel in
                self.onSaveProfile?(addressViewModel)
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.addressRegister = AddressRegisterView()
        self.view = self.addressRegister
        
    }

}
