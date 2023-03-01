//
//  LaunchVC.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/24.
//

import Foundation
import UIKit

// TODO
class LaunchVC: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    private lazy var button: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.title = "Launch"
        
        view.addSubview(button)
    }
    
    @objc func pressed() {
//        coordinator?.eventOccurred(with: <#T##Event#>)
    }
}
