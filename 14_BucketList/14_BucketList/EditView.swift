//
//  EditView.swift
//  14_BucketList
//
//  Created by Laura on 04.10.2022..
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void                  // passing new location (passing new data back)
    
    @State private var name: String
    @State private var description: String
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location      // new location from current location, a copy for modifying
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    
                    onSave(newLocation )
                    dismiss()
                }
            }
        }
    }
    
    // accepts location & uses that to create State structs using locations's data
    // _ approach us to create an instance of the property wrapper not the data inside wrapper
    init(location: Location, onSave: @escaping (Location) -> Void) {    // @escaping - the fun will be called later on, not immediately in initializer, keep it alive until then
        self.location = location
        self.onSave = onSave
        
        // state wrappers, giving them initial strings to work with and placing those wrappers in hidden parts of our properties
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { _ in }   // placeholder closure for location
    }
}
