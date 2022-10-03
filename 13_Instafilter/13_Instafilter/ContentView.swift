//
//  ContentView.swift
//  13_Instafilter
//
//  Created by Laura on 27.09.2022..
//

import CoreImage                                        // access to CoreImage API's
import CoreImage.CIFilterBuiltins                       // modern built-in filters
import SwiftUI

// context - object responsible for rendering CIImage into CGImage - finished set of pixels
//         - expensive to create -> create context once and keep it alive

struct ContentView: View {
    @State private var image: Image?                    // bc initially user won't have selected an image
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?             // store image user selected
    
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
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
                        .onChange(of: filterIntensity) { _ in applyProcessing() }
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
        
        let beginImage = CIImage(image: inputImage)                     // UIImage to CIImage
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)    // 
        applyProcessing()
    }
    
    func save() {
        
    }
    
    func applyProcessing() {
        currentFilter.intensity = Float(filterIntensity)                                    // set filter intensity based on slider
        
        guard let outputImage = currentFilter.outputImage else { return }                   // read output img back from the filter
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {       // ask context to render output img
            let uiImage = UIImage(cgImage: cgimg)                                           // convert back to UI img
            image = Image(uiImage: uiImage)                                                 // place result into image so it's visible
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
