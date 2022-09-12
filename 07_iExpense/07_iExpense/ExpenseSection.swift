//
//  ExpenseSection.swift
//  07_iExpense
//
//  Created by Laura on 12.09.2022..
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .localCurrency)
                        .colorStyle(for: item)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}
