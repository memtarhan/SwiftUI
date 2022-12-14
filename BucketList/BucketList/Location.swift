//
//  Location.swift
//  BucketList
//
//  Created by Mehmet Tarhan on 21/11/2022.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
