//
//  StoreObjectManager.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import Foundation

protocol StoreObjectManagerProtocol: class {
    func saveData(_ data: Any) -> Bool
    func getData() -> Any?
}

class StoreObjectManager {
    private let fileName = "NSKeyedArchiverDataHolder"
    
    private func getDocumentDirectory() -> URL? {
        // Using FileManager to create custom folder
        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return path
        } else {
            return nil
        }
    }
}

extension StoreObjectManager: StoreObjectManagerProtocol {
    func saveData(_ data: Any) -> Bool {
        guard let fullPath = getDocumentDirectory()?.appendingPathComponent(fileName) else {
            print("Get path error")
            return false
        }
        
        do {
            let dataArchived: Data = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
            try dataArchived.write(to: fullPath)
            return true
        } catch {
            print("Couldn't write file")
        }
        
        return false
    }
    
    func getData() -> Any? {
        guard let fullPath = getDocumentDirectory()?.appendingPathComponent(fileName) else {
            print("Get path error")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fullPath)
            if let loadedStrings = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String] {
                return loadedStrings
            }
        } catch {
            print("Couldn't read file.")
        }
        
        return nil
    }
    
    
}
