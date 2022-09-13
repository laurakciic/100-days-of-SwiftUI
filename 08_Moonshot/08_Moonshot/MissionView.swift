//
//  MissionView.swift
//  08_Moonshot
//
//  Created by Laura on 13.09.2022..
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)     // 60% of available screen width
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)                               // stay away from edge of the screen
                }
                .padding(.bottom)                                       // so it can scroll smoothly away from bottom
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)                         // second screen & we don't want big titles
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
