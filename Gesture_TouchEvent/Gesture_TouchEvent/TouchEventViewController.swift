//
//  TouchEventViewController.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class TouchEventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("VIEW touch began")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("VIEW touch end")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("VIEW touch cancel")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("VIEW touch moved")
        if let touch = touches.first {
            let position = touch.location(in: view)
          print(position)
        }
    }
}
