//
//  PlistSampleViewController.swift
//  DataHolderSample
//
//  Created by NhatHM on 4/10/20.
//  Copyright © 2020 GST.SYN. All rights reserved.
//

import UIKit

struct People : Codable {
    var name : String
    var age : String
    var gender : Bool
}

class PlistSampleViewController: UIViewController {
    @IBOutlet private var keyLabel: UILabel!
    @IBOutlet private var valueTextField: UITextField!
    
    private var plistData: Dictionary<String, AnyObject>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plist sample"
        
        guard let peopple = getPlistFile(name: "test") else { return }
        print(peopple.name)
        print(peopple.age)
        print(peopple.gender)
    }
        
    @IBAction func onTapSave(_ sender: UIButton) {
        guard let value = self.valueTextField.text else { return }
        if self.writeToPlist("test", People(name: value, age: "12", gender: false)){
            print("save success")
        }else{
            print("save fail")
        }
    }
}

extension PlistSampleViewController {
    private func getPlistFile(name : String) -> People? {
        guard let settingsURL: URL = Bundle.main.url(forResource: name, withExtension: "plist") else { return nil }
        do {
            let data = try Data(contentsOf: settingsURL)
            let decoder = PropertyListDecoder()
            let people = try decoder.decode(People.self, from: data)
            return people
        } catch {
            print(error)
            return nil
        }
    }
    
    private func writeToPlist(_ name : String ,_ people : People) -> Bool {
        guard let settingsURL: URL = Bundle.main.url(forResource: name, withExtension: "plist") else { return false }
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(people)
            try data.write(to: settingsURL)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    private func getDataFromPlistFile(_ name: String) ->  Dictionary<String, AnyObject>?{
        //PropertyListSample
        if let data = PlistManager().getPlist(withName: name)?.first {
            return data
        }
        
        return nil
    }
    
    // TODO: writing plist data as entity
    private func displayDataFromPlistFile(_ data: Dictionary<String, AnyObject>?) {
        guard let data = data else {
            keyLabel.text = "No data"
            valueTextField.text = "No data"
            return
        }
        
        keyLabel.text = "Class"
                
        if let className = data["Number of trainee"] {
            valueTextField.text = "\(className)"
        } else {
            valueTextField.text = "No data"
        }
    }
    
    @IBAction private func invokeButtonSave(_ sender: UIButton) {
        saveData(valueTextField.text ?? "Woop, no data", to: "PropertyListSample")
    }
    
    private func saveData(_ data: String, to file: String) {
        // User file manager to save data to document
        // let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Preferences.plist")
        
        // Convert dic => entity
        // Save entity => file
    }
}
