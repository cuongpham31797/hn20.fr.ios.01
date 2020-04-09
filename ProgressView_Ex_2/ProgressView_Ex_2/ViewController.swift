//
//  ViewController.swift
//  ProgressView_Ex_2
//
//  Created by Cuong  Pham on 4/8/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var countFired : Int = 0
    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var startButton: UIButton!

    @IBOutlet weak var timeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        timeTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

    @IBAction func onTapStart(_ sender: UIButton) {
        guard let time = self.timeTextField.text else { return }
        guard let time2 = Int(time) else { return }
        if time2 <= 0 || time2 > 1440 {
            let alert = UIAlertController(title: "Error", message: "Error time", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                self.timeTextField.text = ""
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn:"0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
