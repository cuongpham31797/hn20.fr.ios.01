//
//  DetailViewController.swift
//  Server_Communication
//
//  Created by Cuong  Pham on 4/14/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private let serverConnection = ServerConnection()
    var imageURL : String!
    var index : Int!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAndSaveImage()
    }
}

extension DetailViewController{
    private func loadAndSaveImage(){
        guard let index = index else { return }
        //check xem ảnh đã có trong document chưa, nếu có rồi thì load lên luôn
        if let image = FileManagers.shared.loadImageFromDocument("\(index).png"){
            mainImage.image = image
        }else{
        //chưa có thì dowload về
            guard let urlPath = imageURL else { return }
            guard let url = URL(string: "\(serverConnection.domain)\(urlPath.replacingOccurrences(of: " ", with: "%20"))") else { return }
            print(url)
            serverConnection.dowloadImageFromURL(url) { (image, error) in
                if let image = image{
                    DispatchQueue.main.async {
                        self.updateImage(image)
                        if FileManagers.shared.getDocumentDirectory(imageName: "\(index).png", image: image) {
                            print("success")
                        }else{
                            print("fail")
                        }
                    }
                }else{
                    guard let error = error else { return }
                    print(error)
                }
            }
        }
    }
    
    private func updateImage(_ image : UIImage){
        self.mainImage.image = image
    }
}
