//
//  CompanyDetailVC.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/1.
//

import Foundation
import UIKit

class CompanyDetailVC: UIViewController, Coordinating {
    
    // MARK: - Properties

    var coordinator: Coordinator?
    var viewModel = CompanyDetailViewModel()
    var viewData: Company? {
        didSet {
            setupSaveKeyAndValueWith(viewData)
            setupViewWith(viewData)
        }
    }
    private var webURL: String?
    var trackActionBar: UIBarButtonItem?
    var unTrackActionBar: UIBarButtonItem?
    let userDefault = UserDefaults()
    var saveKey: String = ""
    var saveValue: String = ""
    let trackey: String = "TrackingCompany"
    
    // MARK: - UI Component
    
    lazy var basicInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "基本資料"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var companyNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        return label
    }()
    
    lazy var actionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var headerInfoRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var chairmanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "董事長"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var chairmanValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var generaManagerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "總經理"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var generaManagerValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var industryCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "產業類別"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var industryCategoryValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var establishedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "公司成立日期"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var establishedValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var listingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "上市日期"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var listingValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var basicInfoRow1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var basicInfoRow2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var basicInfoRow3StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var basicInfoRow4StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
        
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "總機"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var phoneValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var uniformNumbersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "統一編號"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var uniformNumbersValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "地址"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var addressValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contactInfoRow1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var contactInfoRow2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var contactInfoRow3StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var contactInfoRow4StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "實收資本額 (元)"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var capitalValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var parValuePerShareLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "普通每股面額"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var parValuePerShareValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var issuedSharesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "已發行普通股數或 TDR 原股發行股數"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var issuedSharesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var specialSharesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "特別股"
        label.textColor = .darkGray
        return label
    }()
    
    lazy var specialSharesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var financeInfoRow1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var financeInfoRow2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var financeInfoRow3StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var financeInfoRow4StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var trackImage: UIImage = {
        let image = UIImage(named: "start")!.withRenderingMode(.alwaysOriginal)
        return image
    }()
    
    lazy var unTrackImage: UIImage = {
        let image = UIImage(named: "blackStart")!.withRenderingMode(.alwaysOriginal)
        return image
    }()
    
    // MARK: - Lift Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupConstraints()
        setupBinders()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupRightBarButton()
    }
    
    deinit {
        if let coordinator = coordinator {
            coordinator.parentCoordinator?.childDidFinish(coordinator)
        }        
        print("CompanyDetailVC deinit")
    }
    
    // MARK: - Private Function
    
    private func setupBinders() {
        viewModel.issuedShares.bind { [weak self] value in
            if let value = value {
                self?.issuedSharesValueLabel.text = value
            }
        }
    }
    
    private func setupViewWith(_ data: Company?) {
        
        guard let data = data else {
            return
        }
        title = "\(data.code) \(data.name)"
                
        companyNameLabel.text = data.name
        actionImageView.image = UIImage(named: "earth")
        chairmanValueLabel.text = data.chairman
        generaManagerValueLabel.text = data.generaManager
        industryCategoryValueLabel.text = TSECategory(rawValue: data.category)?.value() ?? ""
        establishedValueLabel.text = data.established.dateFormat()
        listingValueLabel.text = data.listing.dateFormat()
        phoneValueLabel.text = data.phone
        uniformNumbersValueLabel.text = data.uniformNumber
        addressValueLabel.text = data.address
        capitalValueLabel.text = data.capital.moneyFormat()
        parValuePerShareValueLabel.text = data.parValuePerShare.parValuePerShareFormat()
        specialSharesValueLabel.text = data.specialShares.moneyFormat(suffix: .share)
        viewModel.calculatorIssuedShares(capitalValue: data.capital,
                                         parValuePerShareValue: data.parValuePerShare,
                                         specialSharesValue: data.specialShares)
        
        if let webURL = data.webURL {
            self.webURL = webURL.webURLFormat()
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            actionImageView.isUserInteractionEnabled = true
            actionImageView.addGestureRecognizer(tapGestureRecognizer)
        }

        setupRightBarButton()
    }
    
    private func setupSaveKeyAndValueWith(_ data: Company?) {
        guard let data = data else {
            return
        }
        
        saveKey = data.code
        saveValue = "\(data.code) \(data.name)"
    }
    
    private func setupRightBarButton() {
        self.trackActionBar = UIBarButtonItem(image: trackImage, style: .plain, target: self, action: #selector(trackTapped))
        self.unTrackActionBar = UIBarButtonItem(image: unTrackImage, style: .plain, target: self, action: #selector(unTrackTapped))
        if let record = userDefault.value(forKey: trackey) as? [String: Any?] {
            if let data = record[saveKey] as? Data,
               let _ = try? JSONDecoder().decode(Company.self, from: data)
            {
                self.navigationItem.setRightBarButton(unTrackActionBar, animated: false)
            } else {
                self.navigationItem.setRightBarButton(trackActionBar, animated: false)
            }
        } else {
            self.navigationItem.setRightBarButton(trackActionBar, animated: false)
        }
    }
    
    @objc func unTrackTapped() {
        showAlert(type: .unTrack, companyInfo: saveValue)
    }
    
    @objc func trackTapped() {
        showAlert(type: .track, companyInfo: saveValue)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let webURL = webURL else {
            return
        }

        let event = CompanyDetailCoordinatorEvent.openURL(url: URL(string: webURL))
        coordinator?.eventOccurred(with: event)
    }
    
    private func setupConstraints() {
        setupStackView()
        
        NSLayoutConstraint.activate([
                        
            basicInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            basicInfoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                        
            headerInfoRowStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerInfoRowStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            headerInfoRowStackView.topAnchor.constraint(equalTo: basicInfoLabel.bottomAnchor, constant: 10),
            headerInfoRowStackView.heightAnchor.constraint(equalToConstant: 20),
                        
            basicInfoRow1StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicInfoRow1StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            basicInfoRow1StackView.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 20),
            
            basicInfoRow2StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicInfoRow2StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            basicInfoRow2StackView.topAnchor.constraint(equalTo: basicInfoRow1StackView.bottomAnchor, constant: 10),
            
            basicInfoRow3StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicInfoRow3StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            basicInfoRow3StackView.topAnchor.constraint(equalTo: basicInfoRow2StackView.bottomAnchor, constant: 20),
            
            basicInfoRow4StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicInfoRow4StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            basicInfoRow4StackView.topAnchor.constraint(equalTo: basicInfoRow3StackView.bottomAnchor, constant: 10),
            
            contactInfoRow1StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactInfoRow1StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contactInfoRow1StackView.topAnchor.constraint(equalTo: basicInfoRow4StackView.bottomAnchor, constant: 20),
            
            contactInfoRow2StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactInfoRow2StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contactInfoRow2StackView.topAnchor.constraint(equalTo: contactInfoRow1StackView.bottomAnchor, constant: 10),
            
            contactInfoRow3StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactInfoRow3StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contactInfoRow3StackView.topAnchor.constraint(equalTo: contactInfoRow2StackView.bottomAnchor, constant: 20),
            
            contactInfoRow4StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactInfoRow4StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contactInfoRow4StackView.topAnchor.constraint(equalTo: contactInfoRow3StackView.bottomAnchor, constant: 10),
            
            financeInfoRow1StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            financeInfoRow1StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            financeInfoRow1StackView.topAnchor.constraint(equalTo: contactInfoRow4StackView.bottomAnchor, constant: 20),
            
            financeInfoRow2StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            financeInfoRow2StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            financeInfoRow2StackView.topAnchor.constraint(equalTo: financeInfoRow1StackView.bottomAnchor, constant: 20),
            
            financeInfoRow3StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            financeInfoRow3StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            financeInfoRow3StackView.topAnchor.constraint(equalTo: financeInfoRow2StackView.bottomAnchor, constant: 20),
            
            financeInfoRow4StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            financeInfoRow4StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            financeInfoRow4StackView.topAnchor.constraint(equalTo: financeInfoRow3StackView.bottomAnchor, constant: 20),
        ])
    }
    
    private func setupStackView() {
        
        view.addSubview(basicInfoLabel)
        view.addSubview(headerInfoRowStackView)
        
        view.addSubview(basicInfoRow1StackView)
        view.addSubview(basicInfoRow2StackView)
        view.addSubview(basicInfoRow3StackView)
        view.addSubview(basicInfoRow4StackView)
        
        view.addSubview(contactInfoRow1StackView)
        view.addSubview(contactInfoRow2StackView)
        view.addSubview(contactInfoRow3StackView)
        view.addSubview(contactInfoRow4StackView)
        
        view.addSubview(financeInfoRow1StackView)
        view.addSubview(financeInfoRow2StackView)
        view.addSubview(financeInfoRow3StackView)
        view.addSubview(financeInfoRow4StackView)
        
        // header info
        headerInfoRowStackView.addArrangedSubview(companyNameLabel)
        headerInfoRowStackView.addArrangedSubview(actionImageView)
        
        // basic info
        basicInfoRow1StackView.addArrangedSubview(chairmanLabel)
        basicInfoRow1StackView.addArrangedSubview(generaManagerLabel)
        basicInfoRow1StackView.addArrangedSubview(industryCategoryLabel)
        
        basicInfoRow2StackView.addArrangedSubview(chairmanValueLabel)
        basicInfoRow2StackView.addArrangedSubview(generaManagerValueLabel)
        basicInfoRow2StackView.addArrangedSubview(industryCategoryValueLabel)
        
        basicInfoRow3StackView.addArrangedSubview(establishedLabel)
        basicInfoRow3StackView.addArrangedSubview(listingLabel)
        
        basicInfoRow4StackView.addArrangedSubview(establishedValueLabel)
        basicInfoRow4StackView.addArrangedSubview(listingValueLabel)
            
        // contact info
        contactInfoRow1StackView.addArrangedSubview(phoneLabel)
        contactInfoRow1StackView.addArrangedSubview(uniformNumbersLabel)
        
        contactInfoRow2StackView.addArrangedSubview(phoneValueLabel)
        contactInfoRow2StackView.addArrangedSubview(uniformNumbersValueLabel)
        
        contactInfoRow3StackView.addArrangedSubview(addressLabel)
        
        contactInfoRow4StackView.addArrangedSubview(addressValueLabel)
        
        // finance info
        financeInfoRow1StackView.addArrangedSubview(capitalLabel)
        financeInfoRow1StackView.addArrangedSubview(capitalValueLabel)

        financeInfoRow2StackView.addArrangedSubview(parValuePerShareLabel)
        financeInfoRow2StackView.addArrangedSubview(parValuePerShareValueLabel)

        financeInfoRow3StackView.addArrangedSubview(issuedSharesLabel)
        financeInfoRow3StackView.addArrangedSubview(issuedSharesValueLabel)

        financeInfoRow4StackView.addArrangedSubview(specialSharesLabel)
        financeInfoRow4StackView.addArrangedSubview(specialSharesValueLabel)
    }
    
    enum AlertType {
        case track
        case unTrack
    }
    
    private func showAlert(type: AlertType, companyInfo: String) {
        switch type {
        case .track:
            alert(title: "加入追蹤列表", message: "是否將\(companyInfo)加入追蹤列表內", actionTitle: "加入") { [weak self] in
                
                guard let self = self,
                      let encoded = try? JSONEncoder().encode(self.viewData)
                else {
                    return
                }
                
                if var record = self.userDefault.value(forKey: self.trackey) as? [String: Any] {
                    record[self.saveKey] = encoded
                    self.userDefault.set(record, forKey: self.trackey)
                } else {
                    self.userDefault.set([self.saveKey: encoded], forKey: self.trackey)
                }
                
                self.navigationItem.setRightBarButton(self.unTrackActionBar, animated: false)
                
                self.navigationItem.rightBarButtonItem?.isEnabled = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                }
            }
        case .unTrack:
            alert(title: "從追蹤列表中移除", message: "是否將\(companyInfo)從追蹤列表中移除？", actionTitle: "移除") { [weak self] in
                
                guard let self = self else {
                    return
                }
                
                self.navigationItem.setRightBarButton(self.trackActionBar, animated: false)
                
                self.navigationItem.rightBarButtonItem?.isEnabled = false
                
                if var record = self.userDefault.value(forKey: self.trackey) as? [String: Any] {
                    record[self.saveKey] = nil
                    self.userDefault.set(record, forKey: self.trackey)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                }
            }
        }
    }
    
    private func alert(title: String, message: String?, actionTitle: String, completion: @escaping (() -> Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default) { _ in completion() })
        alert.addAction(UIAlertAction(title: "取消", style: .cancel) { _ in completion() })
        let homeType: CompanyDetailCoordinatorEvent = .showAlert(alert: alert)
        coordinator?.eventOccurred(with: homeType)
    }
}
