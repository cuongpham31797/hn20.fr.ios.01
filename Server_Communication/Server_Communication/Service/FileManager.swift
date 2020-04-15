//
//  FileManager.swift
//  Server_Communication
//
//  Created by Cuong  Pham on 4/14/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit

class FileManagers{
    static let shared = FileManagers()
}

extension FileManagers{
    func loadImageFromDocument(_ name: String) -> UIImage? {
        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let url = path.appendingPathComponent(name)
            let image = UIImage(contentsOfFile: url.path)
            return image
        }
        return nil
    }
    
    func getDocumentDirectory(imageName : String, image : UIImage) -> Bool{
        if let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            print(path)
            let url = path.appendingPathComponent(imageName)
            do {
                if let data = image.pngData() {
                    try data.write(to: url)
                    return true
                }
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
        return false
    }
}
