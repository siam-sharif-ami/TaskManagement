//
//  DescriptionTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 25/7/24.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var itemDescription: UITextField!
    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 15
        
        view.layer.shadowOpacity = 0.2
        view.layer.shadowColor = UIColor.blue.cgColor // Set the shadow color to black
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
