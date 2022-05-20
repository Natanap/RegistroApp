//
//  HomeVc.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 05/05/22.
//

import UIKit

class HomeVc: UIViewController {

    
    lazy var homeView: HomeView = {
        let view = HomeView()
        
        return view
    }()
    
    // MARK: Lifecyclie
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = homeView
    }
    

}
