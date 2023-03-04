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
        
    }
    
    deinit {
        print("TrackCoordinator deinit")
    }
}
