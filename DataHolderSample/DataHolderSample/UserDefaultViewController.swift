//
//  UserDefaultViewController.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import UIKit

class UserDefaultViewController: UIViewController {

    @IBOutlet private var userNameTextField: UITextField!
    
    
    //
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UserDefaultManager().saveUserName("NhatHM")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let name = UserDefaultManager().getUserName() {
            print(name)
        } else {
            print("Get data error")
        }
    }
}

extension UserDefaultViewController {
    @IBAction private func invokeButtonSave(_ sender: UIButton) {
        if let userName = userNameTextField.text {
            print(userName)
        } else {
            print("Username empty")
        }
    }
}
