//
//  AddTask.swift
//  TaskManagement
//
//  Created by BS00484 on 10/7/24.
//

import Foundation
import UIKit

class AddTask : UIViewController {
    
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventDescriptionField: UITextField!
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var eventSaveButton: UIButton!
    @IBOutlet weak var isCompletedLabel: UILabel!
    
    @IBOutlet weak var isCompleted: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Event"
        tabBarItem.image = UIImage(named: "plus")
        tabBarItem.title = "Add"
        eventDatePicker.date = selectedDate
       
    }
    
    
    
    @IBAction func saveAction(_ sender: Any ){
        let newEvent = Event()
        if let name = textField.text {
            newEvent.title = name
        }
        if let description = eventDescriptionField.text {
            newEvent.description = description
        }
        newEvent.dueDate = eventDatePicker.date
        newEvent.isCompleted = isCompleted.isOn
        
        if eventsList[CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)] == nil {
            eventsList[CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)] = [newEvent]
        }else {
            eventsList[CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)]?.append(newEvent)
        }
        
    }
}



