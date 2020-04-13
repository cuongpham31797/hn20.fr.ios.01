//
//  MainViewController.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import UIKit


// Encode
// Decode
struct Fresher {
    let name: String
    let age: Int
}

class MainViewController: UIViewController {
    private enum MainViewCell: Int {
        case plistSample = 0
        case userDefaultSample
        case nsKeyedArchiver
        case keyChain
        case fileManager
        case mainViewCellCount
    }
    
    @IBOutlet private var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView(mainTableView)
        
        // Sample FileManager
//        if let image = UIImage(named: "logo-gst.png") {
//            let result = LocalFileManage().saveFileToDocuments(image, "companylogo.png")
//            print(result)
//        }
//          // Create instance
//        let savedImage = LocalFileManage().loadImageFromDocumentWithName("companylogo.png")
//        let nilImage = LocalFileManage().loadImageFromDocumentWithName("companylogooooooo")
//
//        let deletedResult = LocalFileManage().deleteImageWithName("companylogo.png")
        
        // Save object
        let myAsssets = ["iPhone", "Macbook Pro", "iPad", "Watch"]
//        let myAsssets = Fresher(name: "NhatHM", age: 19)
        
        let savedResult = StoreObjectManager().saveData(myAsssets)
        print(savedResult)
        
        if let savedData = StoreObjectManager().getData() {
            print(savedData)
        }
    }
}

extension MainViewController {
    private func setupTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
    }
    
    private func pushViewControllerWithEnum(_ enumType: MainViewCell) {
        switch enumType {
        case .plistSample:
            performSegue(withIdentifier: "MainToPlist", sender: nil)
        case .userDefaultSample:
            performSegue(withIdentifier: "MainToUserDefault", sender: nil)
        case .keyChain:
            performSegue(withIdentifier: "KeyChain", sender: nil)
        case .fileManager:
            performSegue(withIdentifier: "FileManager", sender: nil)
        default:
            break
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewCell.mainViewCellCount.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        
        if let enumValue = MainViewCell(rawValue: indexPath.row) {
            cell.textLabel?.text = "\(enumValue)"
        } else {
            cell.textLabel?.text = "Wrong value for index \(indexPath)"
        }
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cellType = MainViewCell(rawValue: indexPath.row) {
            pushViewControllerWithEnum(cellType)
        } else {
            print("Error - index out of bounds")
        }
    }
}
