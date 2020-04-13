//
//  FileManagerViewController.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import UIKit

class FileManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapCreate(_ sender: UIButton) {
        if createFolder("CachedImages-3") {
            print("Create success")
        }else{
            print("Create fail")
        }
    }
    
    func createFolder(_ name: String) -> Bool {
        guard let path : URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return false
        }
        let folderPath = path.appendingPathComponent(name)
        do{
            try FileManager.default.createDirectory(atPath: folderPath.path, withIntermediateDirectories: true, attributes: nil)
            return true
        }
        catch{
            print(error)
            return false
        }
    }
}
