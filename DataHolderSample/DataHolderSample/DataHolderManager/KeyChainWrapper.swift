//
//  KeyChainWrapper.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import Foundation

protocol KeyChainWrapperProtocol: class {
    func saveData(key: String, value: String) -> Bool
    func loadData(key: String) -> String?
    func deleteData(key: String) -> Bool
}

class KeyChainWrapper {
    
}

extension KeyChainWrapper : KeyChainWrapperProtocol {
    func saveData(key: String, value: String) -> Bool {
        if let dataFromString = value.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let query : CFDictionary = [
                kSecClass as String : kSecClassGenericPassword as String,
                kSecAttrService as String : key,
                kSecValueData as String : dataFromString
            ] as CFDictionary
            let status = SecItemAdd(query, nil)

            if (status != errSecSuccess) {
                if #available(iOS 11.3, *) {
                    if let err = SecCopyErrorMessageString(status, nil) {
                        print("Write failed: \(err)")
                        return false
                    }
                } else {
                    print(status)
                    return false
                }
            }
            return true
        }
        return false
    }
    
    func loadData(key: String) -> String? {
        let query : CFDictionary = [
            kSecClass as String : kSecClassGenericPassword as String,
            kSecAttrService as String : key,
            kSecReturnData as String : kCFBooleanTrue!,
            kSecMatchLimit as String : kSecMatchLimitOne
        ] as CFDictionary

        var dataTypeRef :AnyObject?
        let status: OSStatus = SecItemCopyMatching(query, &dataTypeRef)
        var contentsOfKeychain: String?

        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        return contentsOfKeychain
    }
    
    func deleteData(key: String) -> Bool {
        guard let boolean = kCFBooleanTrue else { return false }
        let query : CFDictionary = [
               kSecClass as String : kSecClassGenericPassword as String,
               kSecAttrService as String : key,
               kSecReturnData as String : boolean
        ] as CFDictionary
        let status = SecItemDelete(query as CFDictionary)
        if (status != errSecSuccess) {
            if #available(iOS 11.3, *) {
                if let err = SecCopyErrorMessageString(status, nil) {
                    print("Remove failed: \(err)")
                    return false
                }
            } else {
                print(status)
                return false
            }
        }
        return true
    }
}
