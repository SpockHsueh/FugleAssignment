//
//  Extension.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/2.
//

import Foundation

enum Suffix: String {
    case yuan = "元"
    case share = "股"
}

extension String {
    func dateFormat() -> String {
        let year = (self as NSString).substring(with: NSMakeRange(0,4))
        let month = (self as NSString).substring(with: NSMakeRange(4,2))
        let day = (self as NSString).substring(with: NSMakeRange(6,2))
        return "\(year)/\(month)/\(day)"
    }
    
    func moneyFormat(suffix: Suffix = .yuan) -> String {
        let money = Int(self) ?? 0
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: money))! + " \(suffix.rawValue)"
    }
    
    func parValuePerShareFormat() -> String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal)
    }
    
    func webURLFormat() -> String {
        return self.trimmingCharacters( in : .whitespaces)
    }
}
