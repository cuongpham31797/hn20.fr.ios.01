//
//  ViewController.swift
//  Handle_HttpRequest_Error
//
//  Created by Cuong  Pham on 4/15/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let serverConnection = ServerConnection()

    @IBOutlet weak var urlTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTapRequest(_ sender: UIButton) {
        self.fetchListData()
    }
}

extension ViewController{
    private func fetchListData(){
        guard let url = urlTextField.text else { return }
        serverConnection.fetchAPIFromURL(url) { (string, errorMsg) in
            if let error = errorMsg{
                self.showAlert(title: "Fail", message: error)
                print(error)
                return
            }
            if let string = string{
                self.showAlert(title: "Success", message: "Load success")
                print(string)
            }
        }
    }
    
    private func showAlert(title: String, message: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK:", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
