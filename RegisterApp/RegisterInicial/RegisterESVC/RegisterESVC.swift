//
//  ViewController.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 18/04/22.
//

import UIKit

class RegisterESVC: UIViewController {

    lazy var registerEsView = RegisterESUiView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerEsView = RegisterESUiView()
        self.view = self.registerEsView
    }


}

