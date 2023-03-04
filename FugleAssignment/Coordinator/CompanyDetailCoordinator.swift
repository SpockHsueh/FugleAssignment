//
//  CompanyDetailCoordinator.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/2.
//

import Foundation
import UIKit

class CompanyDetailCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let companyDetailVC = CompanyDetailVC()
        companyDetailVC.coordinator = self
        rootViewController = companyDetailVC
        return rootViewController
    }
    
    func eventOccurred(with type: Event) {
        guard let type = type as? CompanyDetailCoordinatorEvent else {
            return
        }
        
        switch type {
        case .openURL(let url):
            if let url = url {
                // TODO url 有些沒有 https 會開啟失敗
                UIApplication.shared.open(url)
            }
        case .showAlert(alert: let alert):
            rootViewController.present(alert, animated: true)
        }
    }
    
}
