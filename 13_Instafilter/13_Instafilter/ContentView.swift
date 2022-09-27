//
//  ContentView.swift
//  13_Instafilter
//
//  Created by Laura on 27.09.2022..
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {                            // bc image is optional so there's nowhere to have the onAppear()
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }    // CI needs to have it as a CIImage to read it
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys                             // query filter for its input keys - which keys are supported
            
        if inputKeys.contains(kCIInputIntensityKey) {                       // check if inputKeys contains key for intensity
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)    // inject it dynamically
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        // convert back to SwiftUI Image to display it
        guard let outputImage = currentFilter.outputImage else { return }   // read CIImage out from current filter based on settings
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {   // from: how much of the image (extent - all of it)
            let uiImage = UIImage(cgImage: cgimg)   // convert to UIImage
            image = Image(uiImage: uiImage)         // convert to SwiftUI image
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
