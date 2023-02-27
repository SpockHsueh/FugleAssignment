//
//  MainCoordinator.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?
    var vc: UIViewController?
    
    lazy var homeCoordinator: Coordinator = HomeCoordinator()
    lazy var trackCoordinator: Coordinator = TrackCoordinator()
    
    func start() {
        
        homeCoordinator.navigationController = navigationController
        homeCoordinator.parentCoordinator = self
        children.append(homeCoordinator)
        homeCoordinator.start()
        
        trackCoordinator.navigationController = navigationController
        trackCoordinator.parentCoordinator = self
        children.append(trackCoordinator)
        trackCoordinator.start()
        
        if let homeVC = homeCoordinator.vc,
           let trackVC = trackCoordinator.vc {
            (tabBarController)?.viewControllers = [homeVC,trackVC]
        }
        
    }
    
    func eventOccurred(with type: Event) {
        
    }
    
    
}
