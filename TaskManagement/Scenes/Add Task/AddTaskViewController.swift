import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var button: UIButton!
    
    var newEvent: Event = Event()
    var placeHolder = ["Enter Project Here", "Enter Description Here"]
    
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
        print(newEvent.dueDate)
        let dateString = CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)
        print(dateString)
        
        if eventsList[dateString] == nil {
            eventsList[dateString] = [newEvent]
        } else {
            print(eventsList[CalendarDataSource().dayMonthYearString(date: newEvent.dueDate)])
            eventsList[dateString]?.append(newEvent)
        }
        
        selectedDate = newEvent.dueDate
        
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
            cell.titleTextField.placeholder = placeHolder[indexPath.row]
            cell.delegate = self
            return cell
        } 
        
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            cell.itemDescription.placeholder = placeHolder[indexPath.row]
            cell.delegate = self
            return cell
        }
        
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskGroupTableViewCell", for: indexPath) as! taskGroupTableViewCell
            cell.delegate = self
            return cell
        } 
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaveTableViewCell", for: indexPath) as! SaveTableViewCell
            cell.delegate = self
            return cell
        }
    }
}
extension AddTaskViewController: TitleTableViewCellDelegate, DescriptionTableViewCellDelegate,taskGroupTableViewCellDelegate, SaveTableViewCellDelegate {
    
    func getSwitchState(isSwitchOn: Bool) {
        //print(isSwitchOn)
        newEvent.isCompleted = isSwitchOn
    }
    
    func getDate(date: Date) {
        //print("Date: \(date)")
        newEvent.dueDate = date
    }
    

    func getTextFieldData(textFieldText: String) {
        //print(textFieldText)
        newEvent.title = textFieldText
    }
    func getDescriptionData(itemDescriptionText: String) {
        //print(itemDescriptionText)
        newEvent.description = itemDescriptionText
    }
}
