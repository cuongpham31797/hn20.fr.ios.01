//
//  KeyChainViewController.swift
//  DataHolderSample
//
//  Created by Cuong  Pham on 4/12/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import UIKit

class KeyChainViewController: UIViewController {

    @IBOutlet weak var keyDeleteDataTextField: UITextField!
    @IBOutlet weak var valueLoadDataTextField: UITextField!
    @IBOutlet weak var keyLoadDataTextField: UITextField!
    @IBOutlet weak var valueSaveDataTextField: UITextField!
    @IBOutlet weak var keySaveDataTextField: UITextField!
    
    private let keyChainWrapper : KeyChainWrapper = KeyChainWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapDeleteButton(_ sender: UIButton) {
        guard let key = self.keyDeleteDataTextField.text else { return }
        if key.count > 0 {
            if keyChainWrapper.deleteData(key: key) {
                print("delete success")
            }else{
                print("delete fail")
            }
        }
    }
    
    @IBAction func onTapSaveButton(_ sender: UIButton) {
        guard let key = keySaveDataTextField.text, let value = valueSaveDataTextField.text else { return }
       
        if key.count > 0 && value.count > 0 {
            if self.keyChainWrapper.saveData(key: key, value: value) {
                print("save success")

            }else {
                print("save fail")
            }
        }
    }
    
    @IBAction func onTapLoadButton(_ sender: UIButton) {
        guard let key = keyLoadDataTextField.text else { return }
        if key.count > 0 {
            if let value = keyChainWrapper.loadData(key: key){
                self.valueLoadDataTextField.text = value
            }else{
                print("key ko ton tai")
            }
        }
    }
}
