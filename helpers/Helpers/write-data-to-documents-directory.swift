//
//  write-data-to-documents-directory.swift
//  Helpers
//
//  Created by Laura on 03.10.2022..
//

import SwiftUI

// atomic - all at once, writes to a temp file then renames it to the target filename, which means either the whole file is there, or nothing is

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                                                                                                                
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)          // find all possible documents directories for this user
        return paths[0]                                                                             // return first one, which ought to be the only one
    }
}
