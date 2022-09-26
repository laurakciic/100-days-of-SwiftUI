//
//  _2_CoreDataProjectApp.swift
//  12_CoreDataProject
//
//  Created by Laura on 26.09.2022..
//

import SwiftUI

@main
struct _2_CoreDataProjectApp: App {
    
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.containter.viewContext)
        }
    }
}
