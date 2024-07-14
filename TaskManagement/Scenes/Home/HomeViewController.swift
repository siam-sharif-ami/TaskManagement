//
//  HomeViewController.swift
//  TaskManagement
//
//  Created by BS00484 on 14/7/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tabBarItem.title = "House"
        tabBarItem.image = UIImage(named: "house")
    }
    
}
