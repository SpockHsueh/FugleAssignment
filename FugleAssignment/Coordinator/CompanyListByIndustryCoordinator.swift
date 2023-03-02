//
//  CategoryListDetailCoordinator.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/2.
//

import Foundation
import UIKit

class CompanyListByIndustryCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let companyListByIndustryVC = CompanyListByIndustryVC()
        companyListByIndustryVC.coordinator = self
        return companyListByIndustryVC
    }
    
    func eventOccurred(with type: Event) {
        guard let type = type as? CompanyListByIndustryCoordinatorEvent else {
            return
        }
        
        switch type {
        case .navigationToCompanyDetail(let company):
            let companyDetailCoordinator = CompanyDetailCoordinator()
            companyDetailCoordinator.parentCoordinator = self
            guard let companyDetailVC = companyDetailCoordinator.start() as? CompanyDetailVC else {
                return
            }
            companyDetailVC.viewData = company
            navigationRootViewController?.navigationBar.backgroundColor = .white
            navigationRootViewController?.navigationBar.tintColor = .black
            _ = navigationRootViewController?.pushViewController(companyDetailVC, animated: true)
        }
    }
    
    deinit {
        print("CategoryListDetailCoordinator deinit")
    }
    
    
}
