//
//  DataController.swift
//  11_Bookworm
//
//  Created by Laura on 25.09.2022..
//

import CoreData
import Foundation

class DataController: ObservableObject {    // so we can use @State object with it (alive with app)
    // NSPersistentContainer - responsible for actual data being loaded & saved to the device
    // responsible for loading a model & giving access to the data inside
    
    // prepares data model to be loaded
    let containter = NSPersistentContainer(name: "Bookworm")    // use bookworm data model for container
    
    // load data
    init() {
        containter.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
