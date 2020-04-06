//
//  DetailViewController.swift
//  Navigation_Tabbar_Basic_Advance
//
//  Created by Cuong  Pham on 4/6/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name : String?
    var account : String?

    @IBOutlet weak var mainlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Detail"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "<", style: .done, target: self, action: #selector(onTapBack))
        
        guard let name = name, let account = account else{
            return
        }
        mainlabel.text = "Hello \(name) - \(account)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
    @objc func onTapBack(){
        self.navigationController?.popViewController(animated: true)
    }

}
