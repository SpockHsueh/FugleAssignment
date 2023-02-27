//
//  TrackVC.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/27.
//

import Foundation
import UIKit

class TrackVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}
