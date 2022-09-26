//
//  FilteredList.swift
//  12_CoreDataProject
//
//  Created by Laura on 26.09.2022..
//

import SwiftUI

struct FilteredList: View {
    // stores fetch req, does not create it
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        // changing fetch req
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
