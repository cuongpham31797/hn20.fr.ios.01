//
//  ViewController.swift
//  RegisterForm_Ex_1
//
//  Created by Cuong  Pham on 4/8/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var test: CustomVIew!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var describTextView: UITextView!
    @IBOutlet weak var addressView: CustomVIew!
    @IBOutlet weak var phoneView: CustomVIew!
    @IBOutlet weak var emailView: CustomVIew!
    @IBOutlet weak var fullNameView: CustomVIew!
    @IBOutlet weak var choseGenderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        fullNameView.mainLabel.text = "Họ tên"
        addressView.mainLabel.text = "Địa chỉ"
        emailView.mainLabel.text = "Email"
        phoneView.mainLabel.text = "SĐT"
        registerButton.layer.cornerRadius = 10
        phoneView.mainTextField.keyboardType = .numberPad
        emailView.mainTextField.keyboardType = .emailAddress
        phoneView.mainTextField.delegate = self
    }

    @IBAction func onTapRegister(_ sender: UIButton) {
        guard let name = fullNameView.mainTextField.text, let email = emailView.mainTextField.text, let phone = phoneView.mainTextField.text, let describe = describTextView.text, let add = addressView.mainTextField.text, let gender = choseGenderButton.titleLabel?.text else { return }
        if validateEmail(text: email).count != 0 {
            let failAlert = UIAlertController(title: "Fail", message: validateEmail(text: email), preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            failAlert.addAction(okAction)
            self.present(failAlert, animated: true, completion: nil)
        }else {
            let message = "Họ tên: \(name) \n Email: \(email) \n SDT: \(phone) \n Mô tả: \(describe) \n Giới tính: \(gender) \n Địa chỉ: \(add)"
            let alertController = UIAlertController(title: "Confirm", message: message, preferredStyle: .alert)
            let accpetAction = UIAlertAction(title: "Register", style: .default) { (_) in
                let successAlert = UIAlertController(title: "Success", message: "Đăng ký thành công!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                successAlert.addAction(okAction)
                self.present(successAlert, animated: true, completion: nil)
            }
            alertController.addAction(accpetAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func validatePhone(text : String) -> String {
        var error : String = ""
        do {
            if try NSRegularExpression(pattern: "^[0-9]$", options: .caseInsensitive).firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.count)) == nil {
                error = "Phone invalid"
            }
        }catch {
            return ""
        }
        return error
    }
    
    func validateEmail(text : String) -> String{
        var error : String = ""
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.count)) == nil {
                error = "Email invalid"
            }
        }catch {
            return ""
        }
        return error
    }
    
    @IBAction func choseGender(_ sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "Chọn giới tính của bạn", preferredStyle: .actionSheet)
        let maleButton = UIAlertAction(title: "Nam", style: .default) { (_) in
            print("Nam")
            self.choseGenderButton.setTitle("Nam", for: .normal)
        }
        let femaleButton = UIAlertAction(title: "Nữ", style: .default) { (_) in
            print("Nữ")
            self.choseGenderButton.setTitle("Nữ", for: .normal)
        }
        alertController.addAction(maleButton)
        alertController.addAction(femaleButton)
        alertController.pruneNegativeWidthConstraints()
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.phoneView.mainTextField {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}

//link refer: https://stackoverflow.com/questions/55653187/swift-default-alertviewcontroller-breaking-constraints
extension UIAlertController {
    func pruneNegativeWidthConstraints() {
        for subView in self.view.subviews {
            for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraint)
            }
        }
    }
}
