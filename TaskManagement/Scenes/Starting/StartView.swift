


import Foundation
import UIKit

class StartView: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        imageView.image = UIImage(named: "one")
        label.text = "Task Management & To-Do List"
        textView.text = "This productive tool is designed to help you better manage your task project-wise conveniently"
        button.setTitle("Get Started", for: .normal)
        
         
    }
}
