//
//  ContentView.swift
//  15_Accessibility
//
//  Created by Laura on 10.10.2022..
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
//        Image(decorative: "character")              // decorative - won't be read with voice over
//            .accessibilityHidden(true)              // view invisible to the underlying voice over system
        
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
//        .accessibilityElement(children: .combine)     // read them together
        .accessibilityElement(children: .ignore)        // or just .accesibilityElement() - by default it will ignore children views
        .accessibilityLabel("Your score is 1000")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
