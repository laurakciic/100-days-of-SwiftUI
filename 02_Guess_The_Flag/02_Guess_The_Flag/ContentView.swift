//
//  ContentView.swift
//  02_Guess_The_Flag
//
//  Created by Laura on 07.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var score        = 0
    @State private var round        = 1
    @State private var showingScore = false
    @State private var showingEnd   = false
    @State private var scoreTitle   = ""
    @State private var message      = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "UK", "Italy", "Nigeria", "Poland", "Russia", "Spain", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    // for accessibility purposes
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    struct FlagImage: View {
        var country: String
        
        var body: some View {
            Image(country)
            .renderingMode(.original)   // so it doesn't go blue
            .clipShape(Capsule())
            .shadow(radius: 5)
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 25) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                                // give me the item from countries arr at this position
                                // give me labels dictionary with this key
                                .accessibilityLabel(labels[countries[number], default: "Uknown flag"])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Text("Round: \(round)")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.bold))
                }
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(message)
        }
        
        .alert(scoreTitle, isPresented: $showingEnd) {
            Button("Cancel", role: .cancel) { }
            Button("New round", action: askQuestion)
        } message: {
            Text(message)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score     += 1
            message    = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            message    = "That's the flag of \(countries[number])"
            score     -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if round < 8 {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            round        += 1
        } else {
            scoreTitle = "Round 8/8"
            message    = "Your final score is \(score)."
            
            round      = 0
            score      = 0
            showingEnd = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
