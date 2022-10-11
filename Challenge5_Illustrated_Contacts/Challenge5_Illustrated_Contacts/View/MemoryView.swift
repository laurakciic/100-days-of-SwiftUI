//
//  ContentView.swift
//  Challenge5_Illustrated_Contacts
//
//  Created by Laura on 10.10.2022..
//

import SwiftUI

struct MemoryView: View {
    @State var image: Image?                            // bc initially user won't have selected an image
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?             // store image user selected
    
    @State var name: String
    @State var memory: Memory
    
    var body: some View {
        NavigationView {
            List {
                ForEach(memories) { memory in
                    Text(memory.name)
//                    NavigationLink {
//
//                    } label: {
//                        HStack {
//
//                        }
//                    }
                }
            }
            .navigationTitle("Memories")
            .toolbar() {
                Button {
                    // add an image
                } label: {
                    Label("Add photo", systemImage: "plus")
                        .onTapGesture { showingImagePicker = true }
                }
            }
            .sheet(isPresented: $showingImagePicker) {          // present ImagePicker bound to inputImage
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) { _ in
                loadImage()
                nameMemory()
            }
        }
    }
    
    init(name: String, memory: Memory) {
        _name = State(initialValue: name)
        _memory = State(initialValue: memory)
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func nameMemory() {
        TextField("Name your memory", text: $name)
        memory.name = name
    }
}

//struct MemoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoryView()
//    }
//}
