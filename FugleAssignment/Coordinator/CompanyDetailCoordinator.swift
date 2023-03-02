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
        
    }
    
    
}
