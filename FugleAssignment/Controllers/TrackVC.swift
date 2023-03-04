//
//  TrackVC.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/27.
//

import Foundation
import UIKit

class TrackVC: UIViewController, Coordinating {
    
    // MARK: - Properties
    
    var coordinator: Coordinator?
    var viewModel = TrackViewModel()
    private var cellData: [Company] = []
    let userDefault = UserDefaults()
    private let trackey: String = "TrackingCompany"
    
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
        title = "追蹤"
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupBinders()
        viewModel.getTrackList()
    }
    
    deinit {
        print("TrackVC deinit")
    }
    
    // MARK: - Private Function
    
    private func setupBinders() {
        viewModel.trackList.bind { [weak self] trackList in
            if let trackList = trackList {
                // TODO can sorted
                self?.cellData = trackList
                self?.tableView.reloadData()
            }
        }
    }
    
    private func handleRemove(saveKey: String, index: Int) {
        if var record = userDefault.value(forKey: trackey) as? [String: Any] {
            record[saveKey] = nil
            userDefault.set(record, forKey: self.trackey)
            cellData.remove(at: index)
            tableView.reloadData()
        }
    }
    
    enum AlertType {
        case unTrack
    }
    
    private func showAlert(type: AlertType,
                           companyInfo: String,
                           key: String,
                           index: Int
    ) {
        switch type {
        case .unTrack:
            alert(title: "從追蹤列表中移除", message: "是否將\(companyInfo)從追蹤列表中移除？", actionTitle: "移除") { [weak self] in
                
                guard let self = self else {
                    return
                }
                
                self.handleRemove(saveKey: key, index: index)
            }
        }
    }
    
    private func alert(title: String, message: String?, actionTitle: String, completion: @escaping (() -> Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default) { _ in completion() })
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        let event = TrackCoordinatorEvent.showAlert(alert: alert)
        coordinator?.eventOccurred(with: event)
    }
    
}

// MARK: - Extension

extension TrackVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath)
        let data = cellData[indexPath.row]
        let cellDataModel = CategoryCellDataModel(text: "\(data.code) \(data.name)",
                                                  image: UIImage(named: "rightButton")!)
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
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let key = cellData[indexPath.row].code
        let name = cellData[indexPath.row].name
        let remove = UIContextualAction(style: .destructive,
                                        title: "移除") { [weak self] (action, view, completionHandler) in
            
            self?.showAlert(type: .unTrack, companyInfo: "\(key) \(name)", key: key, index: indexPath.row)
            completionHandler(true)
        }
        remove.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [remove])
        return configuration
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let company = cellData[indexPath.row]
        let event = TrackCoordinatorEvent.navigationToCompanyDetail(company)
        coordinator?.eventOccurred(with: event)
    }
}
