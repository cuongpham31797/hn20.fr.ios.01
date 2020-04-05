//
//  ZeroView.swift
//  Calculator_Excercise_1+2
//
//  Created by Cuong  Pham on 4/4/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

protocol TapZeroButton : class {
    func onTapZero()
}

class ZeroView: UIView {
    weak var delegate : TapZeroButton?
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    @IBAction func onTapZeroButton(_ sender: UIButton) {
        delegate?.onTapZero()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("ZeroView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        zeroButton.layer.cornerRadius = 25
    }
}
