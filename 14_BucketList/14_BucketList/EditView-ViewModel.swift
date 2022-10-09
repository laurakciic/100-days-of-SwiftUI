//
//  EditView-ViewModel.swift
//  14_BucketList
//
//  Created by Laura on 09.10.2022..
//

import SwiftUI
import MapKit

extension EditView {
    @MainActor class ViewModel: ObservableObject {
        enum LoadingState {
            case loading, loaded, failed
        }
        
        @Published var name: String
        @Published var description: String
        
        @Published var loadingState = LoadingState.loading
        @Published var pages = [Page]()             // arr for wikipedia pages fetched from API
        
        var location: Location
        
        init(location: Location) {
            name = location.name
            description = location.description
            self.location = location                // stash location for later
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)           // decode fetched data
                pages = items.query.pages.values.sorted()                               // pull decoded data into object, sorted alphabetically (convert arr values to our pages arr)
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
        
        func createNewLocation() -> Location {
            var newLocation = location      // new location from current location, a copy for modifying
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            
            return newLocation
        }
    }
}
