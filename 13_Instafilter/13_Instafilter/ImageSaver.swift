//
//  ImageSaver.swift
//  13_Instafilter
//
//  Created by Laura on 27.09.2022..
//

import UIKit

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        
        // Parameters
        // 1: image to save
        // 2: object that should be notified about the save finishing
        // 3: method on the obj
        // 4: context - anything that needs to be passed back when method on the obj is called
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
