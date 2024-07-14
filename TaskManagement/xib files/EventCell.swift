//
//  EventCellTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 14/7/24.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var clockImage: UIImageView!
    @IBOutlet var time:UILabel!
    @IBOutlet var isCompleted: UILabel!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
