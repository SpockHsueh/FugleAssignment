//
//  CategoryWithCompaniesModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation

struct CompaniesByIndustryModel {
    let code: String
    let companies: [Company]
}

struct Company: Codable {
    let name: String
    let shortName: String
    let category: String
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
    let webURL: String?
}

extension Company {
    init(param: ListWithIndustryAndCompanyModel) {
        self.init(name: param.name,
                  shortName: param.shortName,
                  category: param.category,
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
                  specialShares: param.specialShares,
                  webURL: param.webURL)
    }
}
