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
    
    var navigationController: UINavigationController?
    
    var tabBarController: UITabBarController?
    
    var vc: UIViewController?
    
    func start() {
        let tackVC = TrackVC()
        tackVC.tabBarItem = UITabBarItem(title: "Track", image: UIImage(systemName: "oc.plaintext"), tag: 0)
        self.vc = tackVC
    }
    
    func eventOccurred(with type: Event) {
        
    }
    
    
}
