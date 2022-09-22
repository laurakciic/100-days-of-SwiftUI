//
//  ContentView.swift
//  10_CupcakeCorner
//
//  Created by Laura on 22.09.2022..
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackID: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackID) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()                        // might take some time
        }
    }
    
    func loadData() async {
        // 1. create URL we want to read
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
        else {
            print("Invalid URL")
            return
        }
        
        // 2. fetch data for URL
        do {
            let (data, _) = try await URLSession.shared.data(from: url) // return type tuple, _ to toss away metadata
            
            // 3. decode result of that data into response struct
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results   // assign results from Response to results in View
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
