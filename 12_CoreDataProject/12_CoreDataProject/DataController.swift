//
//  DataController.swift
//  12_CoreDataProject
//
//  Created by Laura on 26.09.2022..
//

import CoreData
import Foundation

class DataController: ObservableObject {    // so we can use @State object with it (alive with app)
    // NSPersistentContainer - responsible for actual data being loaded & saved to the device
    // responsible for loading a model & giving access to the data inside
    
    // prepares data model to be loaded
    let containter = NSPersistentContainer(name: "CoreDataProject")    // use data model for container
    
    // load data
    init() {
        containter.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            // merge objects based on their properties to decide which ones to overwrite based on the version it has in DB and a new version we have
            // will produce a new object by merging properties of the old & new together
            self.containter.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
