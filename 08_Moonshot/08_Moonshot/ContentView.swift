//
//  ContentView.swift
//  08_Moonshot
//
//  Created by Laura on 12.09.2022..
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {               // horizontal scroll view
            LazyHStack(spacing: 10) {           // with Lazy code runs efficiently (on demand creating rows)
                ForEach(0..<100) {
                    Text("Buhtlica \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)         // scrollbar to the left
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
