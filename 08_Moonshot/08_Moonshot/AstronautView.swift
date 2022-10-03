//
//  AstronautView.swift
//  08_Moonshot
//
//  Created by Laura on 13.09.2022..
//

import SwiftUI

struct AstronautView: View {

    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    //static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let astronauts: [String: Astronaut] = FileManager.default.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
