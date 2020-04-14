//
//  TapViewController.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    private var check : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapFirstImage))
        tap.numberOfTapsRequired = 2
        firstImage.addGestureRecognizer(tap)
        
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(onLongTapSecondImage))
        secondImage.addGestureRecognizer(longTap)
    }
    
    @objc func onTapFirstImage(){
        print("TAP FIRST IMAGE")
        if check {
            firstImage.image = UIImage(named: "3")
            check = false
        }else{
            firstImage.image = UIImage(named: "1")
            check = true
        }
    }
    
    @objc func onLongTapSecondImage(){
        print("LONG TAP SECOND IMAGE")
        if check {
            view.backgroundColor = .cyan
            check = false
        }else{
            view.backgroundColor = .white
            check = true
        }
    }
}
