//
//  taskGroupTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 25/7/24.
//

import UIKit

protocol taskGroupTableViewCellDelegate {
    func getDate(date: Date)
}

class taskGroupTableViewCell: UITableViewCell{

    @IBOutlet var icon: UIImageView!
    @IBOutlet var label: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    //    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var view: UIView!
    var delegate: AddTaskViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.2
         // Set the shadow color to black
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        // Initialization code
        
        datePicker .addTarget(self,action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        delegate?.getDate(date: sender.date)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
