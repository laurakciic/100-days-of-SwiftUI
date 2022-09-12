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
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "EUR")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in               // identify every item uniquely by name
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text(item.amount, format: localCurrency)
                            .foregroundColor(expenseStyle(forAmount: Int(item.amount)))
                        
                    }
                }
                .onDelete(perform: removeItems)
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
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func expenseStyle(forAmount amount: Int) -> Color {
        switch amount {
        case Int.min...10:
            return .green
        case 11...100:
            return .orange
        default:
            return .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
