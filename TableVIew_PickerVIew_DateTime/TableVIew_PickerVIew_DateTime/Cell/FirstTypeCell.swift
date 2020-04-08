//
//  FirstTypeCell.swift
//  TableVIew_PickerVIew_DateTime
//
//  Created by Cuong  Pham on 4/7/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

protocol SwitchState : class {
    func changeSwitchState(_ who : Int, state : Bool)
}

class FirstTypeCell: UITableViewCell {
    weak var delegate : SwitchState?
    var who : Int?
    
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var mainLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func changeSwitchState(_ sender: UISwitch) {
        guard let who = self.who else { return }
        delegate?.changeSwitchState(who, state: stateSwitch.isOn)
        
    }
}
