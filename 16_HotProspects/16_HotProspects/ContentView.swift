//
//  ContentView.swift
//  16_HotProspects
//
//  Created by Laura on 11.10.2022..
//

import SamplePackage
import SwiftUI

struct ContentView: View {
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        // pick 7 numbers from possibleNumbers arr and make them into a single string
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)                 // array of strings
        return strings.joined(separator: ", ")                  // join strings into a single one 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
