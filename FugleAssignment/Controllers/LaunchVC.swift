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
    
    // MARK: - Properties
    
    var coordinator: Coordinator?
    
    // MARK: - UI Component
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "placeholderImage")
        return imageView
    }()
    
    lazy var loadingIdicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        //        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    // MARK: - Lift Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupConstraints()
        loadingIdicator.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        loadingIdicator.stopAnimating()
    }
    
    // MARK: - Private Function
    
    func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(loadingIdicator)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            
            loadingIdicator.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            loadingIdicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIdicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)            
        ])
    }
}
