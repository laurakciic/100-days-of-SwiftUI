//
//  Expenses.swift
//  07_iExpense
//
//  Created by Laura on 09.09.2022..
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()  {    // array of all expenses
        didSet {            
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {                               // read data from UserDefaults
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {     // decode it as an array of ExpenseItem, bc it refers to the idea of ExpenseItem array, not a particular one
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
