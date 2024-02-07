//
//  DetailViewController.swift
//  Form
//
//  Created by Nishant Chauhan on 19/01/24.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedUser:User?
    
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBAction func GoBack(_ sender: UIButton) {

        dismiss(animated: true,completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = selectedUser {
            lblName.text="Name - \(data.name)"
            lblemail.text="Email - \(data.email)"
            lblPassword.text="Password - \(data.password)"
        }

       
    }
}
