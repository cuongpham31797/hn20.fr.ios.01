//
//  ViewController.swift
//  Navigation_Tabbar_Basic_Advance
//
//  Created by Cuong  Pham on 4/6/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var accountTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem.init(barButtonSystemItem: .compose, target: self, action: nil),
            UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: nil)
        ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.title = "Index"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "background_2"), for: .any, barMetrics: .default)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .any, barMetrics: .default)
    }

    @IBAction func onTapDetail(_ sender: UIButton) {
        guard let name = fullNameTextField.text, let account = accountTextField.text else {
            return
        }
        if name != "" && account != ""{
            let detailVC = UIViewController.loadVC(id: "Detail") as! DetailViewController
            detailVC.account = account
            detailVC.name = name
            self.navigationController?.pushViewController(detailVC, animated: true)
        }else{
            let alertController = UIAlertController(title: "Error", message: "Name or Account invalid", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}
