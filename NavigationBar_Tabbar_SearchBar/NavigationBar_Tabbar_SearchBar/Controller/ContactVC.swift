//
//  ContactVC.swift
//  NavigationBar_Tabbar_SearchBar
//
//  Created by Cuong  Pham on 4/9/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {
    
    var searching : Bool = false
    
    var resultArray : [Contact] = []
    
    let contactArray : [Contact] = [
        Contact(phone: 121, name: "David De Gea"),
        Contact(phone: 232, name: "Juan Mata"),
        Contact(phone: 322, name: "Ander Herrera"),
        Contact(phone: 432, name: "Sergio Romero"),
        Contact(phone: 521, name: "Scott McTominay"),
        Contact(phone: 621, name: "Lionel Messi"),
        Contact(phone: 742, name: "Paul Pogba"),
        Contact(phone: 892, name: "Wayne Rooney"),
        Contact(phone: 212, name: "Crisitiano Ronaldo"),
        Contact(phone: 1210, name: "Ryan Giggs"),
        Contact(phone: 115, name: "Paul Schole"),
        Contact(phone: 123, name: "Edwin Vandersar"),
        Contact(phone: 135, name: "Anthorny Marial"),
        Contact(phone: 140, name: "Mason Greenwood"),
        Contact(phone: 151, name: "Michael Carrick"),
    ]

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(UINib(nibName: ContactCell.className, bundle: nil), forCellReuseIdentifier: ContactCell.className)
        mainTableView.tableHeaderView = searchBar
        searchBar.delegate = self
    }
}

extension ContactVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == false {
            return contactArray.count
        }else{
            return self.resultArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: ContactCell.className, for: indexPath) as? ContactCell else { return UITableViewCell() }
        if searching == false{
            cell.mainLabel.text = self.contactArray[indexPath.row].name
        }else {
            cell.mainLabel.text = self.resultArray[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailVC
        if searching == false {
            detail.name = self.contactArray[indexPath.row].name
            detail.phone = String(self.contactArray[indexPath.row].phone)
           
        }else{
            detail.name = self.resultArray[indexPath.row].name
            detail.phone = String(self.resultArray[indexPath.row].phone)
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension ContactVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            self.searching = false
        }else{
            self.resultArray = self.contactArray.filter({$0.name.lowercased().contains(find: searchText.lowercased())})
            self.searching = true
            self.mainTableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searching = false
        searchBar.text = ""
        self.mainTableView.reloadData()
        searchBar.resignFirstResponder()
    }
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
}
