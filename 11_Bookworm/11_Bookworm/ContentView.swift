//
//  ContentView.swift
//  11_Bookworm
//
//  Created by Laura on 25.09.2022..
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    // fetch req with no sorting then put it in a property students with a type FetchedResults of a type Student
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Uknown")
            }
            
            Button("Add") {
                let firstNames = ["Laura", "Luka", "Buhtlica", "Simba"]
                let lastName  = ["Roncevic"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastName[0]
            
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
