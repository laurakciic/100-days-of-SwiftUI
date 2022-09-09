//
//  ExpenseItem.swift
//  07_iExpense
//
//  Created by Laura on 09.09.2022..
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name:   String
    let type:   String
    let amount: Double
}
