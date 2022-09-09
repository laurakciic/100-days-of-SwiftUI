//
//  ContentView.swift
//  Challenge3_Kids_Multiplication_Game
//
//  Created by Laura on 09.09.2022..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SettingsScreen()
    }
}

struct SettingsScreen: View {
    
    @State private var selectedTable                    = 2
    @State static private var selectedNumberOfQuestions = 5
    @State private var numberOfQuestions                = [5, 10, 15, 25, 50]
    
    @State private var questionNumber = Int.random(in: 0..<selectedNumberOfQuestions)
    @State private var questions      = [Question]()
    
    @State private var currentQuestion = 0
    @State private var answer          = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("multiplication table range").font(.subheadline)) {
                    Stepper("\(selectedTable)", value: $selectedTable, in: 2...12)
                }
                
                Section(header: Text("number of questions").font(.subheadline)) {
                    Picker("", selection: SettingsScreen.$selectedNumberOfQuestions) {
                        ForEach(numberOfQuestions, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                HStack {
                    NavigationLink(destination: GameScreen(table: selectedTable, questions: questionNumber),
                    label: {
                        Text("START")
                            .fontWeight(.bold)
                    })
                    .padding()
                }
            }
            .navigationBarTitle("Multiplication")
        }
    }
}

struct GameScreen: View {
    
    var table: Int
    var questions: Int
    
    var body: some View {
        HStack {
            Text("hi")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
