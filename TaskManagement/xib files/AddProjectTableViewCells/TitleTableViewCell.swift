//
//  TitleTableViewCell.swift
//  TaskManagement
//
//  Created by BS00484 on 25/7/24.
//

import UIKit

protocol TitleTableViewCellDelegate {
    func getTextFieldData(textFieldText:String) -> Void
}

class TitleTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var delegate: AddTaskViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleTextField.delegate = self
        
        backView.layer.cornerRadius = 15
        backView.layer.shadowOpacity = 0.2
        // Set the shadow color to black
        backView.layer.shadowOffset = CGSize(width: 0, height: 2)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let delegate = delegate {
            delegate.getTextFieldData(textFieldText: textField.text!)
        }
            return true;
        }
    
}
