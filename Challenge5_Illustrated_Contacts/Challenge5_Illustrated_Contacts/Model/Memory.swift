//
//  Memory.swift
//  Challenge5_Illustrated_Contacts
//
//  Created by Laura on 10.10.2022..
//

import Foundation

struct Memory: Identifiable {
    var id = UUID()
    var name: String
    var imagePath: String?
}

var memories = [
    Memory(id: UUID(), name: "Memory1", imagePath: nil),
    Memory(id: UUID(), name: "Memory2", imagePath: nil),
    Memory(id: UUID(), name: "Memory3", imagePath: nil)
]
