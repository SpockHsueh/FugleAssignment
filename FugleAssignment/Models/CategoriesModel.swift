//
//  CategoriesModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation

struct CategoriesModel: Codable {
    let name: String
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
    
    enum CodingKeys: String, CodingKey {
        case name = "公司名稱"
        case category = "產業別"
        case code = "公司代號"
        case chairman = "董事長"
        case generaManager = "總經理"
        case established = "成立日期"
        case listing = "上市日期"
        case phone = "總機電話"
        case uniformNumber = "營利事業統一編號"
        case address = "住址"
        case capital = "實收資本額"
        case parValuePerShare = "普通股每股面額"
        case issuedShares = "私募股數"
        case specialShares = "特別股"
        case webURL = "網址"
    }
}
