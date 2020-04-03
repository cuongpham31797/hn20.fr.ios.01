//
//  ViewController.swift
//  VC_Life_Cycle
//
//  Created by Cuong  Pham on 4/1/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Screen A did load")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Screen A will appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("Screen A did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Screen A will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Screen A did disappear")
    }
    
    @IBAction func onTapGoToNextScreen(_ sender: UIButton) {
      //  self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}

