//
//  Coordinator.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/24.
//

import Foundation
import UIKit

protocol Event {}

enum HomeEvent: Event {
    case navigationToLaunch
    case navigationToHome
    case navigationToCompaniesByIndustry([Company], String)
}

enum CompanyListByIndustryCoordinatorEvent: Event {
    case navigationToCompanyDetail(Company)
}

enum CompanyDetailCoordinatorEvent: Event {
    case openURL(url: URL?)
    case showAlert(alert: UIAlertController)
}

enum TrackCoordinatorEvent: Event {
    case navigationToCompanyDetail(Company)
    case showAlert(alert: UIAlertController)
}

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var rootViewController: UIViewController { get set }

    func start() -> UIViewController
    func eventOccurred(with type: Event)
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

extension Coordinator {
    func childDidFinish(_ coordinator : Coordinator){
        for (index, child) in children.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
}

extension Coordinator {
    var navigationRootViewController: UINavigationController? {
        get {
            (rootViewController as? UINavigationController)
        }
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}



