//
//  image-saver.swift
//  Helpers
//
//  Created by Laura on 03.10.2022..
//

import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?               // accepts no params, returns nothing, is optional
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        
        // Parameters
        // 1: image to save
        // 2: object that should be notified about the save finishing
        // 3: method on the obj
        // 4: context - anything that needs to be passed back when method on the obj is called
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)                  // needs an UIImage
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
