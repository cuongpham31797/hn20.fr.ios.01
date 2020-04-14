//
//  RotateViewController.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class RotateViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(onRotateImage(_:)))
        mainImage.addGestureRecognizer(rotateGesture)
    }
    
    @objc func onRotateImage(_ gesture : UIRotationGestureRecognizer){
        mainImage.transform = CGAffineTransform(rotationAngle: gesture.rotation)
        print(gesture.rotation)
    }
}
