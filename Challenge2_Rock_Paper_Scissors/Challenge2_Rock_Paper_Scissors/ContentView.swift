//
//  ContentView.swift
//  Challenge2_Rock_Paper_Scissors
//
//  Created by Laura on 08.09.2022..
//

import SwiftUI

struct GestureView: View {
    var gesture: Gesture
    
    var body: some View {
        switch gesture {
        case .rock:
            return Text("✊")
        case .paper:
            return Text("✋")
        case .scissors:
            return Text("✂️")
        }
    }
}

struct GoalView: View {
    var goal: Goal
    
    var body: some View {
        HStack {
            Text("How to")
            if goal == .win {
                Text("win")
                    .foregroundColor(.green)
            } else {
                Text("lose")
                    .foregroundColor(.red)
            }
            Text("this game?")
        }
    }
}

enum Mode: CaseIterable {
    case normal
    case timed
}

struct ContentView: View {
    @State private var game  = RockPaperScissors()
    @State private var score = 0
    
    @State private var gameMode: Mode = .normal
    
    private static var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    static private let maxTime = 5.0
    @State private var remainingTime = ContentView.maxTime
    
    var body: some View {
        VStack {
            Button(action: {
                self.gameMode = (self.gameMode == .normal ? .timed : .normal)
            }, label: {
                Text(gameMode == .normal ? "Untimed game" : "Timed game, remaining \(remainingTime)s")
                    .padding()
            })
            .onReceive(ContentView.timer) { _ in
                self.updateTime()
            }
            
            GestureView(gesture: game.gesture)
                .font(Font.system(size: 100))
            
            GoalView(goal: game.goal)
                .padding(.top)
            
            HStack {
                ForEach(Gesture.allCases, id: \.self) { gesture in
                    Button(action: {
                        self.submitAnswer(withGuess: gesture)
                    }, label: {
                        GestureView(gesture: gesture)
                            .font(Font.system(size: 50))
                            .padding()
                    })
                }
            }
            
            HStack {
                Text("Score")
                Text(String(score))
                    .font(.largeTitle)
            }
        }
    }
    
    private func updateTime() {
        if gameMode == .timed {
            remainingTime -= 1
            
            if remainingTime <= 0 {
                updateScore(withWin: false)
            }
        }
    }
    
    private func submitAnswer(withGuess guess: Gesture) {
        let win = self.game.isCorrect(guess: guess)
        self.updateScore(withWin: win)
    }
    
    private func updateScore(withWin win: Bool) {
        score += win ? 1 : -1
        newRound()
    }
    
    private func newRound() {
        game = RockPaperScissors()
        remainingTime = ContentView.maxTime
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
