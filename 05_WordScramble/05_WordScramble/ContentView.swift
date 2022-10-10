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
    
    @State private var errorTitle   = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
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
                        .accessibilityElement()                             // ignore children - grouping in single voiceover
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("Got it", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            
            .toolbar() {
                ToolbarItem(placement: .bottomBar) {
                    Button("New word", action: startGame)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Score: \(score)")
                }
            }
        }
    }
    
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 2 && answer != rootWord else { return }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'.")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know...")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
            score += 1
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
    
    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range   = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle   = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
