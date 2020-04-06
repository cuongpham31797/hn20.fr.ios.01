//
//  NotificationViewController.swift
//  Navigation_Tabbar_Basic_Advance
//
//  Created by Cuong  Pham on 4/6/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Notification"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: nil)
    }
    
     @IBAction func onTapDetail(_ sender: UIButton) {
     }
}
