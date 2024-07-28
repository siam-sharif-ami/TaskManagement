//
//  DescriptionTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 25/7/24.
//

import UIKit

protocol DescriptionTableViewCellDelegate {
    
    func getDescriptionData(itemDescriptionText: String) -> Void
}

class DescriptionTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var itemDescription: UITextField!
    @IBOutlet var view: UIView!
    
    var delegate:AddTaskViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 15
        
        view.layer.shadowOpacity = 0.2
         // Set the shadow color to black
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let delegate = delegate {
            delegate.getDescriptionData(itemDescriptionText: textField.text!)
        }
            return true;
        }

}
