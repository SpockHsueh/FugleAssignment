//
//  CategoryWithCompaniesModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation

struct CategoryWithCompaniesModel {
    let code: String
    let companies: [Company]
}

struct Company {
    let name: String
    let code: String
}
