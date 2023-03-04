//
//  TrackViewModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/3.
//

import Foundation

class TrackViewModel {
    var trackList: ObserableObject<[Company]?> = ObserableObject(nil)
    private let userDefault = UserDefaults()
    private let trackey: String = "TrackingCompany"

    func getTrackList() {
        if let record = userDefault.value(forKey: trackey) as? [String: Any?] {
            let data = record.values.compactMap({ item -> Company? in
                if let data = item as? Data,
                   let companyRecord = try? JSONDecoder().decode(Company.self, from: data)
                {
                    return companyRecord
                }
                return nil
            })
            trackList.value = data
        }
    }
    
}
