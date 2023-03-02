//
//  CompanyDetailViewModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/2.
//

import Foundation

class CompanyDetailViewModel {
    var issuedShares: ObserableObject<String?> = ObserableObject(nil)
    
    func calculatorIssuedShares(capitalValue: String,
                                        parValuePerShareValue: String,
                                        specialSharesValue: String) {
        let capitalIntValue = Double(capitalValue) ?? 0
        let parValuePerShareIntValue = processParValuePerShare(date: parValuePerShareValue)
        let specialSharesIntValue = Double(specialSharesValue) ?? 0
        let intValue = Int((capitalIntValue &/ parValuePerShareIntValue) - specialSharesIntValue)
        let stringValue = String(intValue).moneyFormat(suffix: .share)
        issuedShares.value = "\(stringValue) (含私募 0 股)"
    }
    
    private func processParValuePerShare(date: String) -> Double {
        let stringArray = date.components(separatedBy: " ")
        return Double(stringArray.last?.components(separatedBy: "元").first ?? "0") ?? 0
    }
}

infix operator &/
extension Double {
    public static func &/(lhs: Double, rhs: Double) -> Double {
        if rhs == 0 {
            return 0
        }
        return lhs/rhs
    }
}
