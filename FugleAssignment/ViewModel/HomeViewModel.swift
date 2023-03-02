//
//  HomeViewModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/27.
//

import Foundation

class HomeViewModel {
    var finishUpdate: ObserableObject<Bool> = ObserableObject(false)
    var getListErrorDescription: ObserableObject<String?> = ObserableObject(nil)
    var listValue: ObserableObject<[String: [CategoryWithCompaniesModel]]?> = ObserableObject(nil)
    
    private let getCategoryWithCompanyService: GetCategoriesWithCompanyServiceProtocol.Type

    private var categoryWithCompanies: [String: [CategoryWithCompaniesModel]] = [:]
    
    init(getCategoryWithCompanyService: GetCategoriesWithCompanyServiceProtocol.Type) {
        self.getCategoryWithCompanyService = getCategoryWithCompanyService
    }
    
    func getGategoriesWithCompany() {
        getCategoryWithCompanyService.getCategories { [weak self] categoryRes in
            switch categoryRes {
            case .failure(let error):
                var errorMessage = ""
                switch error {
                case .unexpectedError(let error):
                    errorMessage = error
                case .invalidURL: errorMessage = "Invalid URL"
                case .missingData: errorMessage = "Missing Data"
                }
                self?.getListErrorDescription.value = errorMessage
                self?.finishUpdate.value = false
                
            case .success(let categories):
                categories.forEach { item in
                    let company = Company(param: item)
                    var record = self?.categoryWithCompanies[item.category] ?? []
                    let value = CategoryWithCompaniesModel(code: item.category, companies: [company])
                    record.isEmpty ? record = [value] : record.append(value)
                    self?.categoryWithCompanies[item.category] = record
                }
                self?.finishUpdate.value = true
                self?.listValue.value = self?.categoryWithCompanies
            }
        }
    }
}

