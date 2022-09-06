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
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var body: some View {
        Form {
            Section {
                
                // $ allows two-way binding so the var gets updated with user input
                
                TextField("Amount", value: $checkAmount, format:
                    .currency(code: Locale.current.currencyCode ?? "EUR"))
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
