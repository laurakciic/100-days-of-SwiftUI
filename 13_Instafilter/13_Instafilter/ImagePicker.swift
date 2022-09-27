//
//  ImagePicker.swift
//  13_Instafilter
//
//  Created by Laura on 27.09.2022..
//

import PhotosUI     // picker
import SwiftUI      // representable stuff

struct ImagePicker: UIViewControllerRepresentable {     // makes a view that can go inside SwiftUI alongside text, images, sliders...
    
    @Binding var image: UIImage?                        // binding so it can send back changes to the main SwiftUI view 
    
    // NSObject               - base class of UIKit hierarchy (all UIViews come from NSObject) - objectiveC allowing us to talk to it at runtime
    // PHPickerViewController - for detecting when user chose an image
    class Coordinator: NSObject, PHPickerViewControllerDelegate {           // acts as a delegate for PickerViewController, talks between UIKit & SwiftUI
        var parent: ImagePicker                                             // points to parent ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {     // autocalled when image is selected/cancel is pressed (auto bc delegate)
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return } // if we can't read first item provider (read data from) they probably hit cancel so bail out
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in     // image is optional so needs to be typecasted
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController { // coordinator is sent in from context
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator                               // use coordinator class as a delegate for picker (report anything that happens inside picker to coordinator)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {     // swift calls it when an instance of ImagePicker struct is made & it will send in the coordinator for us in context
        Coordinator(self)                       // make a new Coordinator instance and send it back
    }                                           // passing ImagePicker struct with the binding into the class so we can modify binding from there
}
