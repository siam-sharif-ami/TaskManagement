//
//  AddTask.swift
//  TaskManagement
//
//  Created by BS00484 on 10/7/24.
//

import Foundation
import UIKit

class AddTask : UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Project"
        let nib = UINib(nibName: "CustomDatePickerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomDatePickerCell")
        tableView.alwaysBounceVertical = false
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AddTask: UITableViewDelegate {
    
}

extension AddTask: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomDatePickerCell", for: indexPath) as! CustomDatePickerCell
                cell.label.text = "Start Date"
                cell.datePicker.date = Date()
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomDatePickerCell", for: indexPath) as! CustomDatePickerCell
                cell.label.text = "End Date"
                return cell
        default:
            fatalError("Unexpected row index")
        }
    }
}
