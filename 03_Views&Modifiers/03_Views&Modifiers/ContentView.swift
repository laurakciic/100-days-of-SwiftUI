//
//  ContentView.swift
//  03_Views&Modifiers
//
//  Created by Laura on 07.09.2022..
//

import SwiftUI

struct LargeBlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func useLargeBlueFont() -> some View {
        modifier(LargeBlueFont())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .useLargeBlueFont()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
