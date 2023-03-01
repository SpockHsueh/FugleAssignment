//
//  HomeCell.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation
import UIKit

class CategoryCell: UITableViewCell, CellConfigurable {
    
    // MARK: - Properties
    
    static let identifier = "CategoryCell"
    
    // MARK: - UI Component

    lazy var actionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    // MARK: - Lift Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
    }
    
    // MARK: - Internal Func

    func setup(dataModel: RowViewModel) {
        guard let data = dataModel as? CategoryCellDataModel else {
            return
        }
        self.titleLabel.text = data.text
        self.actionImage.image = data.image
        self.selectionStyle = .none
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(actionImage)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            actionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            actionImage.heightAnchor.constraint(equalToConstant: 30),
            actionImage.widthAnchor.constraint(equalToConstant: 30),
            actionImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}

