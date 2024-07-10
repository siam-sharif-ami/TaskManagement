//
//  CustomViewTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 10/7/24.
//

import UIKit

class CustomDatePickerCell: UITableViewCell {

    @IBOutlet var icon: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
