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
    private var cellData: [String] = []
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
    
    // MARK: - Private Function
    
    private func setupBinders() {
        viewModel.trackList.bind { [weak self] trackList in
            if let trackList = trackList {
                self?.cellData = Array(trackList.values.map { $0 })
                self?.tableView.reloadData()
            }
        }
    }
    
    private func handleRemove(saveKey: String, index: Int) {
        if var record = userDefault.value(forKey: trackey) as? [String: String] {
            record[saveKey] = nil
            userDefault.set(record, forKey: self.trackey)
            cellData.remove(at: index)
            tableView.reloadData()
        }
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
        let cellDataModel = CategoryCellDataModel(text: data,
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
        if let data = cellData[indexPath.row].split(separator: " ").first {
            let remove = UIContextualAction(style: .destructive,
                                            title: "移除") { [weak self] (action, view, completionHandler) in
                
                self?.handleRemove(saveKey: String(data), index: indexPath.row)
                completionHandler(true)
            }
            remove.backgroundColor = .systemRed
            let configuration = UISwipeActionsConfiguration(actions: [remove])
            return configuration
        }
        return nil
    }
}
