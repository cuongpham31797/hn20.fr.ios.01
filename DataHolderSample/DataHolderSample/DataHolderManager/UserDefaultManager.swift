//
//  UserDefaultManager.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import Foundation

protocol UserDefaultManagerProtocol: AnyObject {
    func saveUserName(_ userName: String) -> Void
    func getUserName() -> String?
}

// UserDefault save data to plist file
class UserDefaultManager {
    
}

extension UserDefaultManager: UserDefaultManagerProtocol {
    func saveUserName(_ userName: String) {
        UserDefaults.standard.set(userName, forKey: "userName")
    }
    
    func getUserName() -> String? {
        return UserDefaults.standard.value(forKey: "userName") as? String
    }
}
