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
    
    enum CodingKeys: String, CodingKey {
        case name = "公司名稱"
        case category = "產業別"
        case code = "公司代號"
    }
}
