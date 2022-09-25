//
//  _1_BookwormApp.swift
//  11_Bookworm
//
//  Created by Laura on 25.09.2022..
//

import SwiftUI

@main
struct _1_BookwormApp: App {
    // makes instance od data controller and keeps it alive
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // inject loaded data into environment
                // managed object context: live versions of data (that exist in memory)
                // view context lets us work with data in memory - load it once, work with the memory, modify & then write out only when ready 
                .environment(\.managedObjectContext, dataController.containter.viewContext)
        }
    }
}
