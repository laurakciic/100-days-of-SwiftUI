//
//  ContentView.swift
//  13_Instafilter
//
//  Created by Laura on 27.09.2022..
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)         // ImagePicker is bound to the image of our $inputImage - binding
        }                                           // will read & write UIImage into local @State property inputImage
        .onChange(of: inputImage) { _ in loadImage() }      // ignore new value coming in and just call loadImage (read inputImg from there)
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }   // check whether inputImage has value
        image = Image(uiImage: inputImage)                  // put it into a new Image view inside that property
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
