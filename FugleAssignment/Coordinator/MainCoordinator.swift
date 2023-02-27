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
    
    lazy var homeCoordinator: Coordinator = HomeCoordinator()
    lazy var trackCoordinator: Coordinator = TrackCoordinator()
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    func start() -> UIViewController {
        
        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)
        
        let trackViewController = trackCoordinator.start()
        trackCoordinator.parentCoordinator = self
        trackViewController.tabBarItem = UITabBarItem(title: "Track", image: UIImage(systemName: "doc.plaintext"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [homeViewController, trackViewController]
                
        return rootViewController
        
    }
        
    
    func eventOccurred(with type: Event) {}
    
    
}
