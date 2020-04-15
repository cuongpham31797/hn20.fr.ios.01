//
//  ServerConnection.swift
//  iOS_Fresher_Day 9
//
//  Created by NhatHM on 4/14/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
// http://www.mocky.io/v2/5e95f1542f00006878025680 -> 200
//"http://www.mocky.io/v2/5e95e9ec2f0000560002563b" // 404
// http://www.mocky.io/v2/5e9672b92f00006978025a49 -> 500

import Foundation
import UIKit

protocol ServerConnectionProtocol {
    func fetchAPIFromURL(_ url: String, completionHandler: @escaping (String?, String?)  -> Void) -> Void
}

class ServerConnection {
    let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
    /// Fetch data from API
    var dataTask: URLSessionDataTask?
}

extension ServerConnection: ServerConnectionProtocol {
    func fetchAPIFromURL(_ url: String, completionHandler: @escaping (String?, String?) -> Void) {
        guard let url = URL(string: url) else {
            completionHandler(nil, "URL Fail")
            return
        }
        
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let error = error as? String {
                completionHandler(nil, "URlFail")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...504).contains(httpResponse.statusCode) else {
                return
            }
            
            switch httpResponse.statusCode{
            case 200:
                guard let _data = data else { return }
                let string = String(data: _data, encoding: .utf8)
                completionHandler(string, nil)
            case 404:
                completionHandler(nil, "Your request was not found")
            case 500:
                completionHandler(nil, "Internal error")
            case 503:
                completionHandler(nil, "You don't have permission to view this page")
            default:
                return
            }
        }
        dataTask?.resume()
    }
}
