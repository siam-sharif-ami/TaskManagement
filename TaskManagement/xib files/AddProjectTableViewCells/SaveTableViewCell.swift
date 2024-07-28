//
//  SaveTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 25/7/24.
//

import UIKit
protocol SaveTableViewCellDelegate {
    func getSwitchState(isSwitchOn: Bool) -> Void
}

class SaveTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var onSwitch: UISwitch!
    var delegate: AddTaskViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        onSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch){
        delegate?.getSwitchState(isSwitchOn: sender.isOn)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
