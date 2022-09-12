//
//  ContentView.swift
//  08_Moonshot
//
//  Created by Laura on 12.09.2022..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {                    // new view, for showing details
                    Text("Detal \(row)")
                } label: {
                    Text("Hello, \(row)")
                        .padding()
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
