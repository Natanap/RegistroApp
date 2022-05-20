//
//  HomeVc.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import UIKit

class HomeVc: UIViewController {

    lazy var homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.homeView
        homeView.backgroundColor = .purple
    }
    

}
