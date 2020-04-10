//
//  DetailVC.swift
//  NavigationBar_Tabbar_SearchBar
//
//  Created by Cuong  Pham on 4/9/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var phone : String?
    var name : String?
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneLabel.text = phone
        nameLabel.text = name
        // Do any additional setup after loading the view.
    }
}
