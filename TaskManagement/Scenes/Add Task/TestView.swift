//
//  TestView.swift
//  TaskManagement
//
//  Created by BS00484 on 15/7/24.
//

import Foundation
import UIKit

class TestView: UIViewController {
    
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var taskView: UIView!
    @IBOutlet var taskImageView: UIImageView!
    @IBOutlet var taskField: UITextField!
    @IBOutlet var titleView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var descView: UIView!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var descTextView: UITextView!
    @IBOutlet var startDateView: UIView!
    @IBOutlet var bgImageView: UIView!
    @IBOutlet var startDateLabel: UILabel!
    
    @IBOutlet var calendarImageView: UIImageView!
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var isCompleteLabel: UILabel!
    
    
    @IBOutlet var isComplete: UISwitch!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func save(_ sender: Any) {
        let newEvent = Event()
        if let name = titleField.text {
            newEvent.title = name
        }
        if let description = descTextView.text {
            newEvent.description = description
        }
        newEvent.dueDate = datePicker.date
        newEvent.isCompleted = isComplete.isOn
        
        if eventsList[CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)] == nil {
            eventsList[CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)] = [newEvent]
        }else {
            eventsList[CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)]?.append(newEvent)
        }
        
        selectedDate = datePicker.date
        
        let alertController = UIAlertController()
        alertController.title = "Success"
        
        let okay = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { action in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okay)
        present(alertController, animated: true, completion: nil)
        
    }
    
}
