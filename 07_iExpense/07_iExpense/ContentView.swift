//
//  ContentView.swift
//  07_iExpense
//
//  Created by Laura on 09.09.2022..
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()                      // watches object from Expenses class
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in   // identify every item uniquely by name
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
