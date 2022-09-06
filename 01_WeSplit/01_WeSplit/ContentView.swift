//
//  ContentView.swift
//  01_WeSplit
//
//  Created by Laura on 06.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    // State property wrapper allows mutating vars within ContentView struct
    
    @State private var checkAmount    = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage  = 20
    
    @FocusState private var amountIsFocused: Bool
        
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue     = checkAmount / 100 * tipSelection
        let grandTotal   = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount  = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue        = checkAmount / 100 * tipSelection
        let grandTotal      = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        let currency = Locale.current.currencyCode ?? "EUR"
        
        return FloatingPointFormatStyle<Double>.Currency(code: currency)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    // $ allows two-way binding so the var gets updated with user input
                    
                    TextField("Amount", value: $checkAmount, format:
                        .currency(code: Locale.current.currencyCode ?? "EUR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")     // $0 is shorthand syntax for closure parameters
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(grandTotal, format: currencyFormatter)
                } header: {
                    Text("Total check")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyFormatter)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    // add flexible space view - pushes done btn to the right side of the screen
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
