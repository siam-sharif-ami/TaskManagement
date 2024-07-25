import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var button: UIButton!
    
    var event: Event = Event()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
        tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.register(UINib(nibName: "taskGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "taskGroupTableViewCell")
        tableView.register(UINib(nibName: "SaveTableViewCell", bundle: nil), forCellReuseIdentifier: "SaveTableViewCell")
        
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    @IBAction func save(_ sender: Any) {
        if eventsList[CalendarDataSource().dayMonthYearString(date: event.dueDate)] == nil {
            eventsList[CalendarDataSource().dayMonthYearString(date:event.dueDate)] = [event]
        } else {
            eventsList[CalendarDataSource().dayMonthYearString(date: event.dueDate)]?.append(event)
        }
        
        print(event)
        selectedDate = event.dueDate
        
        let alertController = UIAlertController(title: "Success", message: nil, preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okay)
        present(alertController, animated: true, completion: nil)
    }
}

extension AddTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as! TitleTableViewCell
            cell.titleTextField.delegate = self
            return cell
        } 
        
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            cell.itemDescription.delegate = self
            return cell
        }
        
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskGroupTableViewCell", for: indexPath) as! taskGroupTableViewCell
            cell.datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
            return cell
        } 
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaveTableViewCell", for: indexPath) as! SaveTableViewCell
            cell.onSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            return cell
        }
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cell = textField.superview?.superview as? TitleTableViewCell, textField == cell.titleTextField {
            event.title = textField.text ?? "whats happening"
        } else if let cell = textField.superview?.superview as? DescriptionTableViewCell, textField == cell.itemDescription {
            event.description = textField.text ?? "what's wrong"
        }
    }
    
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        if let cell = sender.superview?.superview as? taskGroupTableViewCell {
            event.dueDate = sender.date
        }
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        if let cell = sender.superview?.superview as? SaveTableViewCell {
            event.isCompleted = sender.isOn
        }
    }
}
