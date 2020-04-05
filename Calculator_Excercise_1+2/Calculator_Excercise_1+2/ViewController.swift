//
//  ViewController.swift
//  Calculator_Excercise_1+2
//
//  Created by Cuong  Pham on 4/3/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dotView: CustomView!
    @IBOutlet weak var equalView: CustomView!
    @IBOutlet weak var plusView: CustomView!
    @IBOutlet weak var threeVIew: CustomView!
    @IBOutlet weak var twoView: CustomView!
    @IBOutlet weak var oneView: CustomView!
    @IBOutlet weak var minusView: CustomView!
    @IBOutlet weak var sixView: CustomView!
    @IBOutlet weak var fiveView: CustomView!
    @IBOutlet weak var fourView: CustomView!
    @IBOutlet weak var multiplyView: CustomView!
    @IBOutlet weak var nineView: CustomView!
    @IBOutlet weak var eightView: CustomView!
    @IBOutlet weak var sevenView: CustomView!
    @IBOutlet weak var divideView: CustomView!
    @IBOutlet weak var percentView: CustomView!
    @IBOutlet weak var negativeView: CustomView!
    @IBOutlet weak var deleteView: CustomView!
    @IBOutlet weak var zeroView: ZeroView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var theme3Button: UIButton!
    @IBOutlet weak var theme2Button: UIButton!
    @IBOutlet weak var theme1Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        zeroView.delegate = self
        self.setColorForTheme(color1: .white, color2: .darkGray, color3: .white, color4: .orange, color5: .black, color6: .lightGray)
        theme1Button.layer.cornerRadius = 10
        theme2Button.layer.cornerRadius = 10
        theme3Button.layer.cornerRadius = 10
    }
    
    @IBAction func onTapTheme3(_ sender: UIButton) {
        self.setColorForTheme(color1: .white, color2: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), color3: .black, color4: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), color5: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), color6:  #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
    }
    
    @IBAction func onTapTheme2(_ sender: UIButton) {
        self.setColorForTheme(color1: .black, color2: .lightGray, color3: .white, color4: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), color5: .white, color6: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    }
    
    @IBAction func onTapTheme1(_ sender: UIButton) {
        self.setColorForTheme(color1: .white, color2: .darkGray, color3: .white, color4: .orange, color5: .black, color6: .lightGray)
    }
}

extension ViewController {
    func setUpButton(){
        oneView.setUpDelegateAndTag(delegate: self, tag: 1)
        twoView.setUpDelegateAndTag(delegate: self, tag: 2)
        threeVIew.setUpDelegateAndTag(delegate: self, tag: 3)
        fourView.setUpDelegateAndTag(delegate: self, tag: 4)
        fiveView.setUpDelegateAndTag(delegate: self, tag: 5)
        sixView.setUpDelegateAndTag(delegate: self, tag: 6)
        sevenView.setUpDelegateAndTag(delegate: self, tag: 7)
        eightView.setUpDelegateAndTag(delegate: self, tag: 8)
        nineView.setUpDelegateAndTag(delegate: self, tag: 9)
        
        equalView.setUpDelegateAndTag(delegate: self, tag: 11)
        plusView.setUpDelegateAndTag(delegate: self, tag: 12)
        minusView.setUpDelegateAndTag(delegate: self, tag: 13)
        multiplyView.setUpDelegateAndTag(delegate: self, tag: 14)
        divideView.setUpDelegateAndTag(delegate: self, tag: 15)
        
        deleteView.setUpDelegateAndTag(delegate: self, tag: 16)
        negativeView.setUpDelegateAndTag(delegate: self, tag: 17)
        percentView.setUpDelegateAndTag(delegate: self, tag: 18)
        dotView.setUpDelegateAndTag(delegate: self, tag: 10)
    }
    
    func setColorForTheme(color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor, color5: UIColor, color6: UIColor){
        self.view.backgroundColor = color5
        self.mainLabel.textColor = color1
        zeroView.zeroButton.setTitleColor(color1, for: .normal)
        zeroView.zeroButton.backgroundColor = color2
        oneView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        twoView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        threeVIew.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        fourView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        fiveView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        sixView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        sevenView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        eightView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        nineView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        dotView.setUpColorForButton(titleColor: color1, backgroundColor: color2)
        
        equalView.setUpColorForButton(titleColor: color3, backgroundColor: color4)
        plusView.setUpColorForButton(titleColor: color3, backgroundColor: color4)
        minusView.setUpColorForButton(titleColor: color3, backgroundColor: color4)
        multiplyView.setUpColorForButton(titleColor: color3, backgroundColor: color4)
        divideView.setUpColorForButton(titleColor: color3, backgroundColor: color4)
        
        deleteView.setUpColorForButton(titleColor: color5, backgroundColor: color6)
        negativeView.setUpColorForButton(titleColor: color5, backgroundColor: color6)
        percentView.setUpColorForButton(titleColor: color5, backgroundColor: color6)
    }
}

extension ViewController : TapButton, TapZeroButton{
    func onTapZero() {
        print("0")
    }
    
    func onTapButton(output: Int) {
        switch output {
        case 1...9:
            print(output)
        case 10:
            print(",")
        case 11:
            print("=")
        case 12:
            print("+")
        case 13:
            print("-")
        case 14:
            print("×")
        case 15:
            print("÷")
        case 16:
            print("Delete")
        case 17:
            print("+/-")
        case 18:
            print("%")
        default:
            break
        }
    }
}
