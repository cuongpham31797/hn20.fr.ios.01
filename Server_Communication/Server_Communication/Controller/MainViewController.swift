//
//  ViewController.swift
//  Server_Communication
//
//  Created by Cuong  Pham on 4/14/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

extension String {
  func replace(string:String, replacement:String) -> String {
      return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
  }

  func removeWhitespace() -> String {
      return self.replace(string: " ", replacement: "")
  }
}

class MainViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    private var dataArray : [DataImage]?
    private let serverConnection : ServerConnection = ServerConnection()
}
//TODO: life cycle
extension MainViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView(mainTableView)
        fetchListData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reload để khi back từ màn detail về ảnh sẽ được hiển thị luôn
        mainTableView.reloadData()
    }
}

extension MainViewController{
    private func setUpTableView(_ tableView: UITableView){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CustomCell.className, bundle: nil), forCellReuseIdentifier: CustomCell.className)
    }
}

//TODO: load data
extension MainViewController{
    private func convertData(_ data: String){
        let responseData = Data(data.utf8)
        let decoder = JSONDecoder()
        
        var responseDataImage : [DataImage]?
        do{
            responseDataImage = try decoder.decode([DataImage].self, from: responseData)
            dataArray = responseDataImage
            if let _ = dataArray{
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            }
        }catch let error{
            print("Error: \(error)")
        }
    }
    
    private func fetchListData(){
        serverConnection.fetchDataFromURL("/pic_dic.json") { [weak self] (body, errorMessage) in
            guard let self = self else { return }
            if let error = errorMessage{
                print(error)
                return
            }
            if let body = body{
                self.convertData(body)
            }
        }
    }
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "detail") as? DetailViewController else { return }
        if let data = dataArray {
            detailVC.imageURL = data[indexPath.row].path
            detailVC.index = indexPath.row
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as? CustomCell else { return UITableViewCell() }
        if let data = dataArray{
            let fullName = data[indexPath.row].name
            let index = fullName.firstIndex(of: ".")!
            let name = fullName.prefix(upTo: index)
            cell.nameLabel.text = String(name)
            cell.urlLabel.text = "\(serverConnection.domain)\(data[indexPath.row].path)"
        }
        cell.mainImage.image = FileManagers.shared.loadImageFromDocument("\(indexPath.row).png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension NSObject{
    class var className: String{
        return String(describing: self)
    }
}
