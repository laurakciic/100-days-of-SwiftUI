//
//  ContentView.swift
//  15_Accessibility
//
//  Created by Laura on 10.10.2022..
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value += 1
            }
        }
        .accessibilityElement()                     // everything read as one
        .accessibilityLabel("Value")                // default label
        .accessibilityValue(String(value))          // value inside element
        .accessibilityAdjustableAction { direction in       // which direction did user try & adjust this thing - up/down
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
