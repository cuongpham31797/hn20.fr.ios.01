//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Cuong  Pham on 4/9/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    var myNavigationBar: CustomView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNaviBar(onView: self)
        myNavigationBar.searchBar.delegate = self
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: ContactCell.className, bundle: nil), forCellReuseIdentifier: ContactCell.className)
    }
    
    func initNaviBar(onView owner:UIViewController?) {
        if myNavigationBar == nil {
            myNavigationBar = CustomView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
            self.view.addSubview(myNavigationBar)
            myNavigationBar.delegate = owner as? NavigationHandle
        }
    }
}

extension ViewController : NavigationHandle {
    func navigationBarView(_ navigationView: CustomView, clickLeftMenu sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseOut, animations: {
                navigationView.titleLabel.center.x -= 1000
                navigationView.searchButton.center.x -= 1000
                navigationView.searchBar.center.x -= navigationView.frame.width
            }, completion: nil)
        }
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseOut, animations: {
                self.myNavigationBar.titleLabel.center.x += 1000
                self.myNavigationBar.searchButton.center.x += 1000
                self.myNavigationBar.searchBar.center.x += self.myNavigationBar.frame.width
            }, completion: nil)
        }
        self.searching = false
        self.mainTableView.reloadData()
        self.myNavigationBar.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            self.searching = false
        }else{
            self.resultArray = self.contactArray.filter({$0.name.lowercased().contains(find: searchText.lowercased())})
            self.searching = true
            self.mainTableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == false {
            return self.contactArray.count
        }else{
            return self.resultArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: ContactCell.className, for: indexPath) as? ContactCell else { return UITableViewCell() }
        if searching == false{
            cell.mainLabel.text = self.contactArray[indexPath.row].name
        }else{
            cell.mainLabel.text = self.resultArray[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension NSObject {
    class var className : String {
        return String(describing: self)
    }
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
}
