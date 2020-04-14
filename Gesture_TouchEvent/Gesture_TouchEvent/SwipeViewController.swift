//
//  SwipeViewController.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeImageLeft))
        swipeRight.direction = .left
        firstImage.addGestureRecognizer(swipeRight)
        secondImage.frame = CGRect(x: view.frame.width,
                                   y: firstImage.frame.minY
            , width: view.frame.width, height: firstImage.frame.height)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeImageRight))
        swipeLeft.direction = .right
        secondImage.addGestureRecognizer(swipeLeft)
    }
    
    @objc func onSwipeImageLeft(){
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
            self.firstImage.frame = self.firstImage.frame.offsetBy(dx: -self.firstImage.frame.width, dy: 0)
            self.secondImage.frame = self.secondImage.frame.offsetBy(dx: -self.secondImage.frame.width, dy: 0)
        }, completion: nil)
    }
    
    @objc func onSwipeImageRight(){
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
            self.firstImage.frame = self.firstImage.frame.offsetBy(dx: self.firstImage.frame.width, dy: 0)
            self.secondImage.frame = self.secondImage.frame.offsetBy(dx: self.secondImage.frame.width, dy: 0)
        }, completion: nil)
    }
}
