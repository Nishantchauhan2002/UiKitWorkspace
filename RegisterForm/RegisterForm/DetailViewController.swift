import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblPassword: UILabel!
    
    weak var deletionDelegate:userDeletionDelegate? //a kind of reference object
    
    var selectedUser:User?
    var selectedIndex:Int?
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        showDeleteAlert()
        }
    func showDeleteAlert(){
        if let index = selectedIndex {
            let alertController=UIAlertController(title: "Delete User", message: "Are you sure you want to delete the user ?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let okAction=UIAlertAction(title: "OK", style: .destructive ,handler: {action  in
                
                self.deletionDelegate?.didDeleteUser(at: index)
                
                self.showSuccessAlert()
                
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            present(alertController, animated: true,completion: nil)
        }
        
        
    }
    func showSuccessAlert() {
            let successAlert = UIAlertController(title: "Success", message: "User deleted successfully", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler:{
            action in
            
            self.navigationController?.popViewController(animated: true)
        } ))
            present(successAlert, animated: true, completion: nil)
        }
    var userName:String!
    var userEmail:String!
    var UserPassword:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = selectedUser{
            lblName.text="Name - \(data.name)"
            lblEmail.text="Email - \(data.email)"
            lblPassword.text="Password - \(data.password)"
            
        }
       
        
        
    }
    
    
}
