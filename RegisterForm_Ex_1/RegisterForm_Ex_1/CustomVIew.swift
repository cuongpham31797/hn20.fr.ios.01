//
//  CustomVIew.swift
//  RegisterForm_Ex_1
//
//  Created by Cuong  Pham on 4/8/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class CustomVIew: UIView {

    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
