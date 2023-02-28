//
//  HomeViewModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/27.
//

import Foundation

class HomeViewModel {
    var finishUpdate: ObserableObject<Bool> = ObserableObject(false)
    
    private let getCategoryWithCompanyService: GetCategoriesWithCompanyServiceProtocol.Type
    
    init(getCategoryWithCompanyService: GetCategoriesWithCompanyServiceProtocol.Type) {
        self.getCategoryWithCompanyService = getCategoryWithCompanyService
    }
    
    func getGategoriesWithCompany() {
        getCategoryWithCompanyService.getCategories { [weak self] result in
            print(result)
        }
    }
}

