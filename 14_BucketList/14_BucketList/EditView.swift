//
//  EditView.swift
//  14_BucketList
//
//  Created by Laura on 04.10.2022..
//

import SwiftUI

struct EditView: View {
    @StateObject private var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss             // not in view model bc it uses environment which can only be read by the view
    var onSave: (Location) -> Void                  // passing new location (passing new data back)
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    let newLocation = viewModel.createNewLocation()
                    onSave(newLocation )
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    
    // accepts location & uses that to create State structs using locations's data
    // _ approach us to create an instance of the property wrapper not the data inside wrapper
    init(location: Location, onSave: @escaping (Location) -> Void) {            // @escaping - the fun will be called later on, not immediately in initializer, keep it alive until then
        self.onSave = onSave
        _viewModel = StateObject(wrappedValue: ViewModel(location: location))   // pass what we were given as location
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { _ in }   // placeholder closure for location
    }
}
