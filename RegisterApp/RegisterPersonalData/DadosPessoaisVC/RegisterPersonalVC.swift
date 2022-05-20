//
//  DadosPessoaisVC.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 20/04/22.
//

import UIKit

class RegisterPersonalVc: UIViewController {
    
    var onNextTaped: (()-> Void)?
    
    lazy var dadosSensiveis: RegisterDataView = {
        let view = RegisterDataView()
        
        view.onNextTaped = {
            self.onNextTaped?()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.dadosSensiveis
    
    }
    

}


