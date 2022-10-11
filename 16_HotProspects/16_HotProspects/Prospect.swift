//
//  Prospect.swift
//  16_HotProspects
//
//  Created by Laura on 11.10.2022..
//

import SwiftUI

class Prospect: Identifiable, Codable {         // class bc it allows to change an instance of this class anywhere in our project and updated in all views
    var id = UUID()
    var name = "Anonymus"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()                // NEEDS TO BE CALLED BEFORE CHANGING VALUES!
        prospect.isContacted.toggle()
    }
}
