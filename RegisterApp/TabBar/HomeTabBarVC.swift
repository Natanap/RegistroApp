//
//  HomeTabBarVC.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 10/05/22.
//

import UIKit

class HomeTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        self.tabBar.tintColor = .systemGreen
        self.tabBar.isTranslucent = false
    }
}

