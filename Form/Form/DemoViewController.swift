import UIKit

struct User:Codable{
    var name:String
    var email:String
    var password:String
    var dateofJoin:String
}

class DemoViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCnfPassword: UITextField!
    @IBOutlet weak var onSubmitTap: UIButton!
    @IBOutlet weak var datepicker: UIDatePicker!
    private var selectedDate:String = ""

    
    private var usersArray: [User] = []
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
//        dateFormatter.dateFormat="dd/mm/yyyy"
                selectedDate = dateFormatter.string(from: sender.date)
    }
    
    private func checkValidation()->Bool{
        
        var flagChecked=false;
        
        if !txtName.text!.isEmpty{
            if !txtEmail.text!.isEmpty{
                if !txtPassword.text!.isEmpty{
                    if !txtPassword.text!.isEmpty{
                        if !selectedDate.isEmpty{
                            //password matching
                            if txtPassword.text! == txtCnfPassword.text!{
                                flagChecked=true
                            }
                        }
                        
                    }
                }
            }
        }
        
        return flagChecked
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func OnSubmitTap(_ sender: UIButton) {
        if checkValidation(){
            guard let txtname = txtName.text,
                  let txtemail = txtEmail.text,
                  let txtpassword = txtPassword.text
            else{
                return
            }
            
            let newUser = User(name: txtname, email: txtemail, password: txtpassword,dateofJoin:selectedDate)
            usersArray.append(newUser)
            
            txtName.text = ""
            txtEmail.text = ""
            txtPassword.text = ""
            txtCnfPassword.text=""
        }
        else{
            let alertController = UIAlertController(
                        title: "Alert !!! ",
                        message: "Please fill the correct details",
                        preferredStyle: .alert
                    )

                    // Add an action (button) to the alert
                    let okAction = UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: { _ in
                            // Handle OK button tap if needed
                            print("OK button tapped")
                        }
                    )

                    // Add the action to the alert controller
                    alertController.addAction(okAction)

                    // Present the alert controller
                    present(alertController, animated: true, completion: nil)
                }
            
        }
    @IBAction private func ViewAll(_ sender: UIButton) {
        
        sender.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside )
//        print(usersArray)
        
    }
    @objc func goToNextScreen(){
         let nextScreen=ShowUsers()
            
        nextScreen.users=usersArray
        
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    
}
