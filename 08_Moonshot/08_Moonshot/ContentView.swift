//
//  ContentView.swift
//  08_Moonshot
//
//  Created by Laura on 12.09.2022..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("aldrin")
                .resizable()                                                // make image scaleable & stretchable
                .scaledToFit()
                .frame(width: geo.size.width * 1)                           // 100% width
                .frame(width: geo.size.width, height: geo.size.height)      // align image
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
