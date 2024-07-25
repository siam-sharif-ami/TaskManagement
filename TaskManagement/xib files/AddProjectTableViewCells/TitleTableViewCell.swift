//
//  TitleTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 25/7/24.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 15
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowColor = UIColor.purple.cgColor // Set the shadow color to black
        backView.layer.shadowOffset = CGSize(width: 0, height: 2)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
