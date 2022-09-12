//
//  View-ExpenseStyle.swift
//  07_iExpense
//
//  Created by Laura on 12.09.2022..
//

import SwiftUI

extension View {
    func colorStyle(for item: ExpenseItem) -> some View {
        if item.amount < 11 {
            return self.foregroundColor(.green)
        } else if item.amount < 100 {
            return self.foregroundColor(.orange)
        } else {
            return self.foregroundColor(.red)
        }
    }
    
    func titleStyle(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
