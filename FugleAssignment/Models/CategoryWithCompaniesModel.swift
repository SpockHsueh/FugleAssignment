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
    let chairman: String
    let generaManager: String
    let established: String
    let listing: String
    let phone: String
    let uniformNumber: String
    let address: String
    let capital: String
    let parValuePerShare: String
    let issuedShares: String
    let specialShares: String
}

extension Company {
    init(param: CategoriesModel) {
        self.init(name: param.name,
                  code: param.code,
                  chairman: param.chairman,
                  generaManager: param.generaManager,
                  established: param.established,
                  listing: param.listing,
                  phone: param.phone,
                  uniformNumber: param.uniformNumber,
                  address: param.address,
                  capital: param.capital,
                  parValuePerShare: param.parValuePerShare,
                  issuedShares: param.issuedShares,
                  specialShares: param.specialShares)
    }
}
