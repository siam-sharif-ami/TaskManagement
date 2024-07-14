//
//  TabBarController.swift
//  TaskManagement
//
//  Created by BS00484 on 11/7/24.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.delegate = self
        
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
    }
}

//extension TabBarController : UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController.isKind(of: AddTask.self){
//            let vc = AddTask()
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true, completion: nil)
//            return false
//        }
//        return true
//    }
//}
