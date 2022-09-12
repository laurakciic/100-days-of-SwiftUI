//
//  ExpenseItem.swift
//  07_iExpense
//
//  Created by Laura on 09.09.2022..
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {      // Equatable - checking whether one item is equal to another, being able to find items by hand
    var id = UUID()                                         // generates Equatable conformance: compares every property against every other
    let name:   String                                      // Needed here to return false as soon as ID is not matching (for deleting)
    let type:   String
    let amount: Double
}
