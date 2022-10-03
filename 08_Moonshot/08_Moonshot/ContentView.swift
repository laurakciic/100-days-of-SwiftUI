//
//  ContentView.swift
//  08_Moonshot
//
//  Created by Laura on 12.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    //let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    //let missions: [Mission] = Bundle.main.decode("missions.json")

    let astronauts: [String: Astronaut] = FileManager.default.decode("astronauts.json")
    let missions: [Mission] = FileManager.default.decode("missions.json")
    
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
