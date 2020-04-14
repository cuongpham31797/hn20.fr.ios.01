//
//  ViewController.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    private let titleArray : [String] = ["Touch event", "Gesture"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.register(UINib(nibName: "TypeCell", bundle: nil), forCellReuseIdentifier: TypeCell.className)
        self.mainTableView.bounces = false
        self.mainTableView.tableFooterView = UIView()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: TypeCell.className, for: indexPath) as? TypeCell else { return UITableViewCell() }
        cell.mainLabel.text = self.titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            guard let touchScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TouchEvent") as? TouchEventViewController else { return }
            self.navigationController?.pushViewController(touchScreen, animated: true)
        }else{
            guard let gesture = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Tabbar") as? CustomTabbarController else { return }
            self.navigationController?.pushViewController(gesture, animated: true)
        }
    }
}

extension NSObject {
    class var className : String {
        return String(describing: self)
    }
}
