//
//  EventCellTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 14/7/24.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var clockImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var taskIconView: UIImageView!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
