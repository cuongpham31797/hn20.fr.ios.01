//
//  ServerConnection.swift
//  Server_Communication
//
//  Created by Cuong  Pham on 4/14/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit

protocol ServerConnectionProtocol {
    func fetchDataFromURL(_ url: String, completionHandler: @escaping (String?, String?) -> Void)
    func dowloadImageFromURL(_ url: URL, completionHandler: @escaping (UIImage?, String?) -> Void)
}

class ServerConnection{
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    
    var downloadTask: URLSessionDownloadTask?
    
    let domain : String = "https://vapor-mock.herokuapp.com"
}

extension ServerConnection: ServerConnectionProtocol{
    func dowloadImageFromURL(_ url: URL, completionHandler: @escaping (UIImage?, String?) -> Void) {
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        downloadTask = defaultSession.downloadTask(with: request, completionHandler: { (localURL, response, error) in
            if let imageURL = localURL {
                do {
                    let imageData = try Data(contentsOf: imageURL)
                    if let image = UIImage(data: imageData) {
                        completionHandler(image, nil)
                    } else {
                        completionHandler(nil, "Error")
                    }
                } catch let error {
                    completionHandler(nil, error.localizedDescription)
                }
            } else {
                completionHandler(nil, "Error")
            }
        })
        
        downloadTask?.resume()
    }
    
    func fetchDataFromURL(_ url: String, completionHandler: @escaping (String?, String?) -> Void) {
        guard let url = URL(string: "\(domain)\(url)") else {
            completionHandler(nil, "Error URL")
            return
        }
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error as? String{
                completionHandler(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    completionHandler(nil, "HTTP status failed")
                    return
            }
            
            guard let _data = data else { return }
            let string = String(data: _data, encoding: .utf8)
            completionHandler(string, nil)
        })
        dataTask?.resume()
    }
}
