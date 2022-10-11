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
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        
        // no saved data
        people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()                // NEEDS TO BE CALLED BEFORE CHANGING VALUES!
        prospect.isContacted.toggle()
        save()
    }
}
