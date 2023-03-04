//
//  HomeVC.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/27.
//

import Foundation
import UIKit

class HomeVC: UIViewController, Coordinating {
    
    // MARK: - Properties
    
    var coordinator: Coordinator?
    var viewModel = HomeViewModel(getCategoryWithCompanyService: GetCategoriesWithCompanyService.self)
    private var cellData: [[CompaniesByIndustryModel]] = []
    
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
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        view.backgroundColor = .white
        title = "產業別"
        
        setupBinders()
        self.navigationToLaunch()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.viewModel.getGategoriesWithCompany()
        }
    }
    
    func navigationToLaunch() {
        let event = HomeEvent.navigationToLaunch
        coordinator?.eventOccurred(with: event)
    }
    
    private func setupBinders() {
        viewModel.finishUpdate.bind { [weak self] isFinishUpdate in
            if isFinishUpdate {
                let event = HomeEvent.navigationToHome
                self?.coordinator?.eventOccurred(with: event)
            }
        }
        
        viewModel.listValue.bind { [weak self] listValue in
            if let listValue = listValue {
                listValue.forEach { _, value in
                    self?.cellData.append(value)
                }
                self?.tableView.reloadData()
            }
        }
        
    }
}

// MARK: - Extension

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath)
        let data = cellData[indexPath.row]
        let text = TSECategory(rawValue: data.first?.code ?? "")?.value() ?? ""
        let count = data.count
        let cellDataModel = CategoryCellDataModel(text: "\(text)(\(count))", image: UIImage(named: "rightButton")!)
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
        let companies = cellData[indexPath.row].flatMap{ $0.companies }
        let title = TSECategory(rawValue: cellData[indexPath.row].first?.code ?? "")?.value() ?? ""
        let event = HomeEvent.navigationToCompaniesByIndustry(companies, title)
        coordinator?.eventOccurred(with: event)
    }
    
}
