//
//  TrackViewModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/3/3.
//

import Foundation

class TrackViewModel {
    var trackList: ObserableObject<[String: String]?> = ObserableObject(nil)
    private let userDefault = UserDefaults()
    private let trackey: String = "TrackingCompany"

    func getTrackList() {
        if let record = userDefault.value(forKey: trackey) as? [String: String] {
            trackList.value = record
        }
    }
    
}
