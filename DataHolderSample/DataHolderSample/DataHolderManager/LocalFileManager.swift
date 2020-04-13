//
//  LocalFileManager.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import Foundation
import UIKit

protocol LocalFileManagerProtocol {
    func saveFileToDocuments(_ image: UIImage, _ imageName: String) -> Bool
    func loadImageFromDocumentWithName(_ name: String) -> UIImage?
    func deleteImageWithName(_ name: String) -> Bool
}

class LocalFileManage {
    private func getDocumentDirectory() -> URL? {
        
        // Using FileManager to create custom folder
        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return path
        } else {
            return nil
        }
    }
}

extension LocalFileManage: LocalFileManagerProtocol {
    func saveFileToDocuments(_ image: UIImage, _ imageName: String) -> Bool {
        guard let url = getDocumentDirectory()?.appendingPathComponent(imageName) else {
            print("Get document folder error")
            return false
        }
        
        do {
            if let data = image.pngData() {
                try data.write(to: url)
                return true
            }
            
            
        } catch {
            print(error.localizedDescription)
        }
        
        return false
    }
    
    func loadImageFromDocumentWithName(_ name: String) -> UIImage? {
        guard let url = getDocumentDirectory()?.appendingPathComponent(name) else {
            print("Get document folder error")
            return nil
        }
                
        let image = UIImage(contentsOfFile: url.path)
        return image
    }
    
    func deleteImageWithName(_ name: String) -> Bool {
        guard let url = getDocumentDirectory()?.appendingPathComponent(name) else {
            print("Get document folder error")
            return false
        }
        
        do {
            try FileManager.default.removeItem(atPath: url.path)
            return true
        } catch (let error) {
            print(error)
        }
        
        return false
    }
}
