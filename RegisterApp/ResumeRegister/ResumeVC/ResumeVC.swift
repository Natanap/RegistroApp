//
//  ResumeVC.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 04/05/22.
//

import UIKit

class ResumeVC: UIViewController {

    var onGoHome: (() -> Void )?
    
    //MARK: Variables
    var coordinatorViewModel: CoordinatorViewModel?
    
    //MARK: Elements Views
    lazy var resumeScreen: ResumeView = {
        let coordinatorViewModel = self.coordinatorViewModel ?? CoordinatorViewModel()
        let view = ResumeView(withCoordinatorViewModel: coordinatorViewModel)
        
        view.onGoHome = {
            self.onGoHome?()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setProfileViewModel(coordinatorViewModel: CoordinatorViewModel) {
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    override func loadView() {
        self.view = resumeScreen
    }
}
