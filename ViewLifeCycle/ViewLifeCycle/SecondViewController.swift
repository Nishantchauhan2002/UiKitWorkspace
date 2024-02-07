//
//  SecondViewController.swift
//  ViewLifeCycle
//
//  Created by Nishant Chauhan on 29/01/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var enteredName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = enteredName{
            nameLabel.text="Hello \(data)"
        }
       
    }
    
    
}
