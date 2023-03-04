//
//  HomeCoordinator.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/24.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
        
    lazy var rootViewController: UIViewController = UIViewController()

    func start() -> UIViewController {
        let homeVC = HomeVC()
        homeVC.coordinator = self
        rootViewController = UINavigationController(rootViewController: homeVC)        
        return rootViewController
    }
    
    func eventOccurred(with type: Event) {
        guard let type = type as? HomeEvent else {
            return
        }
        
        switch type {
        case .navigationToHome:
            _ = navigationRootViewController?.popToRootViewController(animated: true)
            navigationRootViewController?.navigationBar.prefersLargeTitles = true
            navigationRootViewController?.setNavigationBarHidden(false, animated: false)
            navigationRootViewController?.tabBarController?.tabBar.isHidden = false
            
        case .navigationToLaunch:
            let launchVC = LaunchVC()
            _ = navigationRootViewController?.pushViewController(launchVC, animated: true)
            navigationRootViewController?.setNavigationBarHidden(true, animated: false)
            navigationRootViewController?.tabBarController?.tabBar.isHidden = true
            
        case .navigationToCompaniesByIndustry(let cellData, let title):
            let categoryListDetailCoordinator = CompanyListByIndustryCoordinator()
            categoryListDetailCoordinator.parentCoordinator = self
            guard let companyListByIndustryVC = categoryListDetailCoordinator.start() as? CompanyListByIndustryVC,
                  let navigationController = navigationRootViewController
            else {
                return
            }
            categoryListDetailCoordinator.rootViewController = navigationController
            companyListByIndustryVC.cellData = cellData
            companyListByIndustryVC.title = title
            navigationRootViewController?.navigationBar.backgroundColor = .white
            navigationRootViewController?.navigationBar.tintColor = .black
            _ = navigationRootViewController?.pushViewController(companyListByIndustryVC, animated: true)
        }
    }
    
    deinit {
        print("HomeCoordinator deinit")
    }
    
}
