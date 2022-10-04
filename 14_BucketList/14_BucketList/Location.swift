//
//  Location.swift
//  14_BucketList
//
//  Created by Laura on 04.10.2022..
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
