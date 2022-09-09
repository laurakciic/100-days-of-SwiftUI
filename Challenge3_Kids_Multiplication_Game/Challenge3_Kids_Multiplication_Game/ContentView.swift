//
//  ContentView.swift
//  Challenge3_Kids_Multiplication_Game
//
//  Created by Laura on 09.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTableChoice = 2
    @State private var selectedNumberOfQuestions = 5
    @State private var numberOfQuestions        = [5, 10, 15, 25, 50]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("multiplication table range").font(.subheadline)) {
                    Stepper("\(selectedTableChoice)", value: $selectedTableChoice, in: 2...12)
                }
                
                Section(header: Text("number of questions").font(.subheadline)) {
                    Picker("", selection: $selectedNumberOfQuestions) {
                        ForEach(numberOfQuestions, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Button("START") {
                            
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Multiplication")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
