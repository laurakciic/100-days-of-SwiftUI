//
//  ContentView.swift
//  14_BucketList
//
//  Created by Laura on 03.10.2022..
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {           // left/right hand side
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
    User(firstName: "Laura", lastName: "Kovačić"),
    User(firstName: "Luka", lastName: "Rončević")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
