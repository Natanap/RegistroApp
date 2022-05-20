//
//  DadosPessoaisVC.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 20/04/22.
//

import UIKit

class RegisterPersonalVC: UIViewController {
    
    var onNextTaped: ((_ profileViewModel: ProfileViewModel)-> Void)?
    
    lazy var registerDataView: RegisterDataView = {
        let view = RegisterDataView()
        
        view.onNextTaped = {profileViewModel in
            self.onNextTaped?(profileViewModel)
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.registerDataView
    
    }
    

}


