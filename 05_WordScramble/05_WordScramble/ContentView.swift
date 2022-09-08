//
//  ContentView.swift
//  05_WordScramble
//
//  Created by Laura on 08.09.2022..
//

import SwiftUI

struct ContentView: View {

    @State private var usedWords = [String]()
    @State private var rootWord  = ""
    @State private var newWord   = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
        }
    }
    
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        // extra validation to come
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    private func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "buhtlica"
                
                return
            }
        }
        fatalError("Unable to load start.txt from bundle.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
