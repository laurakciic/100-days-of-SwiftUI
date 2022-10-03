//
//  ContentView.swift
//  13_Instafilter
//
//  Created by Laura on 27.09.2022..
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?                    // bc initially user won't have selected an image
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?             // store image user selected
    
    var body: some View {
        NavigationView {    // so we can show app's name at the top
            VStack{
                ZStack {
                    Rectangle()                         // large gray box over which we'll place imported pic
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding()
                
                HStack{
                    Button("Change filter") {
                        // change filter
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in loadImage() }      // when ImagePicker has been dismissed / inputImage value changes
            .sheet(isPresented: $showingImagePicker) {          // present ImagePicker bound to inputImage
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func save() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
