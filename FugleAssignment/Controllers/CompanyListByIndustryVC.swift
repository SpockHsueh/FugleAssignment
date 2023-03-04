//
//  CategoryDetail.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/1.
//

import Foundation
import UIKit

class CompanyListByIndustryVC: UIViewController, Coordinating {
    
    // MARK: - Properties

    var coordinator: Coordinator?
    var cellData: [Company] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - UI Component

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    // MARK: - Lift Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    deinit {
        print("CompanyListByIndustryVC deinit")
    }
}

// MARK: - Extension

extension CompanyListByIndustryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath)
        let data = cellData[indexPath.row]
        let text = "\(data.code) \(data.shortName)"
        let cellDataModel = CategoryCellDataModel(text: text, image: UIImage(named: "rightButton")!)
        if let cell = cell as? CellConfigurable
        {
            cell.setup(dataModel: cellDataModel)
        }
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let company = cellData[indexPath.row]
        let event = CompanyListByIndustryCoordinatorEvent.navigationToCompanyDetail(company)
        coordinator?.eventOccurred(with: event)
    }
    
}
