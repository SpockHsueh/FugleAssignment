//
//  TrackCoordinator.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/24.
//

import Foundation
import UIKit

class TrackCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let trackVC = TrackVC()
        trackVC.coordinator = self
        rootViewController = UINavigationController(rootViewController: trackVC)
        navigationRootViewController?.navigationBar.prefersLargeTitles = true
        return rootViewController
    }
    
    func eventOccurred(with type: Event) {
        guard let type = type as? TrackCoordinatorEvent else {
            return
        }
        
        switch type {
        case .navigationToCompanyDetail(let company):
            let companyDetailCoordinator = CompanyDetailCoordinator()
            companyDetailCoordinator.parentCoordinator = self
            guard let companyDetailVC = companyDetailCoordinator.start() as? CompanyDetailVC,
                  let navigationController = navigationRootViewController
            else {
                return
            }
            companyDetailCoordinator.rootViewController = navigationController
            companyDetailVC.viewData = company
            navigationRootViewController?.navigationBar.backgroundColor = .white
            navigationRootViewController?.navigationBar.tintColor = .black
            _ = navigationRootViewController?.pushViewController(companyDetailVC, animated: true)
        }
    }
    
    deinit {
        print("TrackCoordinator deinit")
    }
}
