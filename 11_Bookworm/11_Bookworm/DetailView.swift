//
//  DetailView.swift
//  11_Bookworm
//
//  Created by Laura on 25.09.2022..
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc        // for deleting
    @Environment(\.dismiss) var dismiss                 // for dismiss action
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                // picture behind genre
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                // in bottom right corner of ZStack
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))    // translucent black
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)                // to bring it in from bottom right edge
            }
            
            Text(book.author ?? "Uknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            if let date = book.date {
                Text(date.formatted(date: .abbreviated, time: .omitted))
            }
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)         // bc this is a second screen
        
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {  }
        } message: {
            Text("Are you sure?")
        }
        
        .toolbar {                                     // starts deletion process
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}
