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
    @State private var filterRadius = 5.0
    @State private var filterScale = 5.0
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?             // store image user selected
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()      // conform to CIFilter
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    @State private var showingSaveError = false
    @State private var showingSaveSuccessMsg = false
    
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
                
                if currentFilter.inputKeys.contains(kCIInputIntensityKey) {
                    HStack {
                        Text("Intensity")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity) { _ in applyProcessing() }
                    }
                    .padding()
                }
                
                if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
                    HStack {
                        Text("Radius")
                        Slider(value: $filterRadius, in: 0...200)
                            .onChange(of: filterRadius) { _ in applyProcessing() }
                    }
                    .padding()
                }

                if currentFilter.inputKeys.contains(kCIInputScaleKey) {
                    HStack {
                        Text("Scale")
                        Slider(value: $filterScale, in: 0...10)
                            .onChange(of: filterScale) { _ in applyProcessing() }
                    }
                    .padding()
                }
                
                HStack{
                    Button("Change filter") {
                        showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save)
                        .disabled(inputImage == nil)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in loadImage() }      // when ImagePicker has been dismissed / inputImage value changes
            .sheet(isPresented: $showingImagePicker) {          // present ImagePicker bound to inputImage
                ImagePicker(image: $inputImage)
            }
        }
        .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
            Button("Bloom") { setFilter(CIFilter.bloom()) }
            Button("Crystallize") { setFilter(CIFilter.crystallize()) }
            Button("Edges") { setFilter(CIFilter.edges()) }
            Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
            Button("Noir") { setFilter(CIFilter.photoEffectNoir()) }
            Button("Pixellate") { setFilter(CIFilter.pixellate()) }
            Button("Pointillize") { setFilter(CIFilter.pointillize()) }
            Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
            Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
            Button("Cancel", role: .cancel) { }
        }
        .alert("Oops, something went wrong.", isPresented: $showingSaveError) {
            Button("OK") { }
        } message: {
            Text("Please check that you have allowed permission for this app to save photos.")
        }
        
        .alert("Success!", isPresented: $showingSaveSuccessMsg) {
            Button("OK") { }
        } message: {
            Text("Image saved successfully.")
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }               // make sure there is an image
        
        let beginImage = CIImage(image: inputImage)                     // UIImage to CIImage
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)    // pass CIImage into current filter
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            showingSaveSuccessMsg = true
        }
        
        imageSaver.errorHandler = { _ in
            showingSaveError = true
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)       // set filter intensity based on slider
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey)       // set filter radius
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale, forKey: kCIInputScaleKey)      // set filter scale
        }
        
        guard let outputImage = currentFilter.outputImage else { return }               // read output img back from the filter
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {       // ask context to render output img
            let uiImage = UIImage(cgImage: cgimg)                                           // convert to UI img so we can save it to album
            image = Image(uiImage: uiImage)                                                 // place result into image so it's visible
            processedImage = uiImage                                                        // copy for later on
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
