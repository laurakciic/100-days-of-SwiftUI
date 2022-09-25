//
//  ContentView.swift
//  11_Bookworm
//
//  Created by Laura on 25.09.2022..
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc    // to store view context for coordinator model so we can use that later to delete books
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>  // reading saved books so we can show updates on UI
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            Text("Cound: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
