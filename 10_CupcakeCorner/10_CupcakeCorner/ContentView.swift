//
//  ContentView.swift
//  10_CupcakeCorner
//
//  Created by Laura on 22.09.2022..
//

import SwiftUI

// final - no subclasses
class User: ObservableObject, Codable {
    
    // to save the name property from struct
    enum CodingKeys: CodingKey {        // contains instances of CodingKey
        case name
    }
    
    // struct - generic (can make instances of it)
    @Published var name = "Laura"
    
    // convert back from json, xml, yaml...
    // read data from Decoder
    required init(from decoder: Decoder) throws {   // required - subclasses need to override with their own values
        let container = try decoder.container(keyedBy: CodingKeys.self)     // container keyed by encoding keys
        name = try container.decode(String.self, forKey: .name)             // look for exact key
    }
    
    // convert user instance into finished data ready to go off to json, xml, yaml...
    // write out our values attached to each key
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)                           // write name to key na
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
