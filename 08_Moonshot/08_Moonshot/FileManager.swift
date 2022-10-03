//
//  FileManager.swift
//  08_Moonshot
//
//  Created by Laura on 03.10.2022..
//

import Foundation

extension FileManager {
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func decode<T: Codable>(_ fromFile: String) -> T {
        let url = getDocumentsDirectory().appendingPathComponent(fromFile)
        
        guard let savedData = try? Data(contentsOf: url) else {
            fatalError("Failed to read from file.")
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: savedData) else {
            fatalError("Failed to decode data.")
        }
        
        return decodedData
    }
    
    func encode<T: Codable>(_ data: T, toFile filename: String) {
        guard let encoded = try? JSONEncoder().encode(data) else {
            fatalError("Failed to encode data.")
        }

        let url = getDocumentsDirectory().appendingPathComponent(filename)
        
        do {
            try encoded.write(to: url)
        } catch {
            fatalError("Failed to write to file.")
        }
    }
}
