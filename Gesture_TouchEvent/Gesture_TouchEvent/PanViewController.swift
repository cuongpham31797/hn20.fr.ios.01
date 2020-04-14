//
//  PanViewController.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panFirst = UIPanGestureRecognizer(target: self, action: #selector(onPanFirstImage))
        mainImage.addGestureRecognizer(panFirst)
        
        let panSecond = UIPanGestureRecognizer(target: self, action: #selector(onPanSecondImage(_:)))
        secondImage.addGestureRecognizer(panSecond)
    }
    
    @objc func onPanFirstImage(_ gesture : UIPanGestureRecognizer){
        let point : CGPoint = gesture.location(in: self.view)
        mainImage.center = point
        print(point)
    }
    
    @objc func onPanSecondImage(_ gesture : UIPanGestureRecognizer){
        let point : CGPoint = gesture.location(in: self.view)
        secondImage.center = point
        print(point)
    }
}
