//
//  PinchViewController.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinchFirst = UIPinchGestureRecognizer(target: self, action: #selector(onPinchFirstImage(_:)))
        firstImage.addGestureRecognizer(pinchFirst)
    }
    
    @objc func onPinchFirstImage(_ gesture : UIPinchGestureRecognizer){
        if gesture.state == .began || gesture.state == .ended{
            firstImage.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
        }
    }
}
