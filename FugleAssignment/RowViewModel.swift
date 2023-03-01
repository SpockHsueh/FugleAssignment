//
//  RowViewModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation

protocol RowViewModel {}

protocol CellConfigurable {
    func setup(dataModel: RowViewModel)
}
