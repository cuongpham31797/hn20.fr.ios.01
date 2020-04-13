//
//  PlistManager.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import Foundation

protocol PlistManagerProtocol: AnyObject {
    func getPlist(withName name: String) -> [Dictionary<String, AnyObject>]?
}

class PlistManager {
    
}

extension PlistManager: PlistManagerProtocol {
    func getPlist(withName name: String) -> [Dictionary<String, AnyObject>]? {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            do {
                print(path)
                let pListObject = try PropertyListSerialization.propertyList(from: xml, options:PropertyListSerialization.ReadOptions(), format:nil)
                print(pListObject)
                
                if let pListDict = pListObject as? Dictionary<String, AnyObject> {
                  return [pListDict]
                }
                
                //Cast pListObject - If expected data type is Array of Dict
                if let pListArray = pListObject as? [Dictionary<String, AnyObject>] {
                  return pListArray
                }
                
            } catch (let error) {
                print(error)
                return nil
            }
        }

        return nil
    }
}
