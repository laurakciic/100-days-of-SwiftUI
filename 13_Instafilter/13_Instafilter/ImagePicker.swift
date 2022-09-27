//
//  ImagePicker.swift
//  13_Instafilter
//
//  Created by Laura on 27.09.2022..
//

import PhotosUI     // picker
import SwiftUI      // representable stuff

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
}
