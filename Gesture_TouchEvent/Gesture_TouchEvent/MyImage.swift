//
//  MyImage.swift
//  Gesture_TouchEvent
//
//  Created by Cuong  Pham on 4/13/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class MyImage: UIImageView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("IMAGE touch began")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("IMAGE touch end")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("IMAGE touch move")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("IMAGE touch cancell")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
