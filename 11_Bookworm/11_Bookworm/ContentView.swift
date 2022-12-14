//
//  ContentView.swift
//  11_Bookworm
//
//  Created by Laura on 25.09.2022..
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc    // to store view context for coordinator model so we can use that later to delete books
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>  // reading saved books so we can show updates on UI
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Uknown Title")
                                    .font(.headline)
                                    .foregroundColor(book.rating == 1 ? .red : .primary)
                                
                                Text(book.author ?? "Uknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .opacity(book.rating == 1 ? 0.5 : 1)
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
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
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()         // write changes to system storage
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
