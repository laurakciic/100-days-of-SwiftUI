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
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount  = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue         = checkAmount / 100 * tipSelection
        let grandTotal       = checkAmount + tipValue
        let amountPerPersonn = grandTotal / peopleCount
        
        return amountPerPersonn
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
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
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
