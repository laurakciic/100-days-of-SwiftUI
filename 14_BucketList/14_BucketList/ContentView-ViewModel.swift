//
//  ContentView-ViewModel.swift
//  14_BucketList
//
//  Created by Laura on 08.10.2022..
//

import Foundation
import LocalAuthentication
import MapKit

// @MainActor - responsible for running all UI updates
// ObservableObject - to report back changes to any view watching it

// EVERYTIME YOU HAVE A CLASS CONFORM TO ObservableObject ADD @MainActor

extension ContentView {
    @MainActor class ViewModel: ObservableObject {              // every part of the class should run on main actor so it's safe to update UI
        
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations: [Location]       // only the class itself can set locations
        @Published var selectedPlace: Location?                 // for handling sheet
        @Published var isUnlocked = false
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")     // same file for reading & writing
        
        // initializer that will load data from disk
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        // ensure the file is written with encryption so it can only be read once the user has unlocked their device
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else { return }

            
            if let index = locations.firstIndex(of: selectedPlace) {        // track it with index  (find current place of index in array)
                locations[index] = location                                 // override it with new location
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        Task {  @MainActor in           // running on main actor bc evaluatePolicy which calls this closure 
                            self.isUnlocked = true
                        }
                    } else {
                        // error
                    }
                }
            } else {
                // no biometrics 
            }
        }
    }
}

