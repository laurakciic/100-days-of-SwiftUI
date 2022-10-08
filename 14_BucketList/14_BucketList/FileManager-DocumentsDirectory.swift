//
//  FileManager-DocumentsDirectory.swift
//  14_BucketList
//
//  Created by Laura on 08.10.2022..
//

import Foundation

extension FileManager {
    
    // allows to make an URL to a file in Documents dir
    
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
