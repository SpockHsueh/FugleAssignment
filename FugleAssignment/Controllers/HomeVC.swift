//
//  HomeVC.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/27.
//

import Foundation
import UIKit

class HomeVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel = HomeViewModel(getCategoryWithCompanyService: GetCategoriesWithCompanyService.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        setupBinders()
        navigationToLaunch()
        
        viewModel.getGategoriesWithCompany()
    }
    
    func navigationToLaunch() {
        let event = HomeEvent.navigationToLaunch
        coordinator?.eventOccurred(with: event)
    }
    
    private func setupBinders() {
        viewModel.finishUpdate.bind { isFinishUpdate in
            // TODO dismiss launch vc
        }
    }
}
