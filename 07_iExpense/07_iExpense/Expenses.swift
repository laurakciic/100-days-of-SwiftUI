//
//  Expenses.swift
//  07_iExpense
//
//  Created by Laura on 09.09.2022..
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()      // array of all expenses
}
