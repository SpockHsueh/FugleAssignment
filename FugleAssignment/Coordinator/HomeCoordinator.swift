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
    
    var navigationController: UINavigationController?
    
    var tabBarController: UITabBarController?
    
    var vc: UIViewController?
    
    func start() {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)
        self.vc = homeVC
    }
    
    func eventOccurred(with type: Event) {
        
    }
    
    
}
