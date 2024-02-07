
import Foundation
import UIKit

class EmpHomeViewController:ViewController{
    
    @IBOutlet weak var txtConfirmPassword:UITextField!;
    @IBOutlet weak var txtPassword:UITextField!;
    @IBOutlet weak var txtEmail:UITextField!;
    @IBOutlet weak var txtName:UITextField!;
    
    private var users: [[String: String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor=UIColor.red
        
    }
    private func checkValidation()->Bool{
        
        var flagChecked=false;
        
        if !txtName.text!.isEmpty{
            if !txtEmail.text!.isEmpty{
                if !txtPassword.text!.isEmpty{
                    if !txtConfirmPassword.text!.isEmpty{
                        
                        //password matching
                        
                        if txtPassword.text! == txtConfirmPassword.text!{
                            flagChecked=true
                        }
                        
                    }
                }
            }
        }
        
        return flagChecked
    }
    
    @IBAction private func submitButtonTapped(_ sender: UIButton) {
        if checkValidation(){
            guard let name = txtName.text,
                  let email = txtEmail.text,
                  let password = txtPassword.text
            else{
                return
            }
            
            let newUser = ["name": name, "email": email, "password": password]
            users.append(newUser)
            
            txtName.text = ""
            txtEmail.text = ""
            txtPassword.text = ""
            txtConfirmPassword.text=""
        }
        else{
        print("Please enter the valid inputs")
    }
}
}
