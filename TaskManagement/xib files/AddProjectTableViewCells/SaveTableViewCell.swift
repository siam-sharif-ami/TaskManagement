//
//  SaveTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 25/7/24.
//

import UIKit

class SaveTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var onSwitch: UISwitch!
    @IBOutlet var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
