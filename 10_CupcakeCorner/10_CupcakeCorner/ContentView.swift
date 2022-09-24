//
//  ContentView.swift
//  10_CupcakeCorner
//
//  Created by Laura on 22.09.2022..
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            ProgressView()                          // loading spinner
//        }
//        .frame(width: 200, height: 200)
        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
