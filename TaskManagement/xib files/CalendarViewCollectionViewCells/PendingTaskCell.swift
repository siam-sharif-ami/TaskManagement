//
//  PendingTaskCell.swift
//  TaskManagement
//
//  Created by BS00484 on 16/7/24.
//

import UIKit

class PendingTaskCell: UICollectionViewCell {

    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var clockImageView: UIImageView!
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet var taskIconView: UIImageView!
    @IBOutlet var timeLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
