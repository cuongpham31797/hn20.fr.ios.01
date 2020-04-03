//
//  SecondViewController.swift
//  VC_Life_Cycle
//
//  Created by Cuong  Pham on 4/1/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Screen B did load")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Screen B did disappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Screen B did appear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Screen B will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Screen B will disappear")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
