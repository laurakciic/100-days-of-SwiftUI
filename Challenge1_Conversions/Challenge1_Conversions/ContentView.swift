//
//  ContentView.swift
//  Challenge1_Conversions
//
//  Created by Laura on 07.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var input      = 0.0
    @State private var inputUnit  = "days"
    @State private var outputUnit = "hours"
    
    @FocusState private var amountFocused: Bool
    
    let units = ["seconds", "minutes", "hours", "days"]
    
    var solution: String {
        let inputToSecondsMultiplier: Double
        let secondsToOutputDivider:   Double
        
        switch inputUnit {
        case "minutes":
            inputToSecondsMultiplier = 60.0
        case "hours":
            inputToSecondsMultiplier = 3600.0
        case "days":
            inputToSecondsMultiplier = 86400.0
        default:
            inputToSecondsMultiplier = 1.0
        }
        
        switch outputUnit {
        case "minutes":
            secondsToOutputDivider = 60.0
        case "hours":
            secondsToOutputDivider = 3600.0
        case "days":
            secondsToOutputDivider = 86400.0
        default:
            secondsToOutputDivider = 1.0
        }
        
        var output = 0.0
        output = (input * inputToSecondsMultiplier)/secondsToOutputDivider
        
        let inputString  = input.formatted()  + " \(inputUnit)"
        let outputString = output.formatted() + " \(outputUnit)"
        
        return "\(inputString) equals \(outputString)."
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountFocused)
                    
                } header: {
                    Text("convert")
                }
                
                Section {
                    Picker("Time options", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("from")
                }
                
                Section {
                    Picker("Time options", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("to")
                }
                
                Section {
                    Text(solution)
                } header: {
                    Text("conversion")
                }
            }
            .navigationTitle("Time Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountFocused = false
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
