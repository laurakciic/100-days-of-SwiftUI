//
//  ContentView.swift
//  07_iExpense
//
//  Created by Laura on 09.09.2022..
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()                      // watches object from Expenses class
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {  // needs to know which inputArray it's reading from (personal/business)
        var objectsToDelete = IndexSet()                                    // new IndexSet by locating each item in the full arrray
        
        for offset in offsets {
            let item = inputArray[offset]                                   // locating each item?
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)                   // deleting in bulk using remove(atOffsets:) like before
    }
    
    // wrapping in two simper methods that SwiftUI can call directly from onDelete()
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
