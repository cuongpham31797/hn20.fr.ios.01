//
//  CustomView.swift
//  Calculator_Excercise_1+2
//
//  Created by Cuong  Pham on 4/4/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

protocol TapButton : class {
    func onTapButton(output : Int)
}

class CustomView: UIView {
    weak var delegate : TapButton?
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet var containerVIew: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        borderButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        borderButton()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(containerVIew)
        containerVIew.frame = self.bounds
        containerVIew.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func onTapButton(_ sender: UIButton) {
        delegate?.onTapButton(output: mainButton.tag)
    }
}

extension CustomView {
    private func borderButton(){
        mainButton.layer.cornerRadius = mainButton.frame.width / 2
        mainButton.clipsToBounds = true
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 33)
    }
    
    func setUpColorForButton(titleColor : UIColor, backgroundColor : UIColor) {
           self.mainButton.setTitleColor(titleColor, for: .normal)
           self.mainButton.backgroundColor = backgroundColor
       }
       
    func setUpDelegateAndTag(delegate on: UIViewController, tag : Int) {
           self.delegate = on as? TapButton
           self.mainButton.tag = tag
           switch tag {
           case 0...9:
               self.mainButton.setTitle("\(tag)", for: .normal)
           case 10:
               self.mainButton.setTitle(",", for: .normal)
           case 11:
               self.mainButton.setTitle("=", for: .normal)
           case 12:
               self.mainButton.setTitle("+", for: .normal)
           case 13:
               self.mainButton.setTitle("-", for: .normal)
           case 14:
               self.mainButton.setTitle("×", for: .normal)
           case 15:
               self.mainButton.setTitle("÷", for: .normal)
           case 16:
               self.mainButton.setTitle("AC", for: .normal)
           case 17:
               self.mainButton.setTitle("+/-", for: .normal)
           case 18:
               self.mainButton.setTitle("%", for: .normal)
           default:
               break
           }
    }
}
