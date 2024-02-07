import UIKit

struct User:Codable{
    var name:String
    var email:String
    var password:String
}
class FirstScreen: UIViewController {
    
    let userDefault=UserDefaults.standard
    
    var userArray:[User]=[]{
        didSet{
            saveUserToUserDefaults()
        }
    }
    
    @IBOutlet weak var TxtName: UITextField!
    @IBOutlet weak var TxtEmail: UITextField!
    @IBOutlet weak var TxtPassword: UITextField!
    
    func NoUserAlert(){
        let alertController=UIAlertController(title: "Alert !!! ", message: "No user Registered ", preferredStyle: .alert)
        
        let okOption=UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okOption)
        
        present(alertController, animated: true,completion: nil)
    }
    @IBAction func showData(_ sender: UIButton) {
        if userArray.count == 0 {
            NoUserAlert()
        }
        sender.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
    }
    
    @objc func gotoNextScreen(){
        let nextScreen=SecondScreen()
        
        nextScreen.users=userArray
        
        navigationController?.pushViewController(nextScreen, animated: true)
        
       
//        performSegue(withIdentifier: "showUsers", sender: self)
        
    }
    
    
    //saved the data locally
    func saveUserToUserDefaults(){
        if let encodeData = try? JSONEncoder().encode(userArray){
            userDefault.set(encodeData, forKey: "userArray")
            userDefault.synchronize()
        }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showUsers"{
//            if let userListVC = segue.destination as? SecondScreen {
//                userListVC.users = userArray
//            }
//        }
//    }
        
        @IBAction func onSubmitTap(_ sender: UIButton) {
            if checkValidation(){
                guard let Ename=TxtName.text,
                      let Eemail=TxtEmail.text,
                      let Epassword=TxtPassword.text
                else{
                    return
                }
                
                let addNewUser=User(name:Ename,email:Eemail,password:Epassword)
                userArray.append(addNewUser)
                
                SubmitAlert()
                
                TxtName.text=""
                TxtEmail.text=""
                TxtPassword.text=""
                
                print(userArray)
            }else{
                EmptyAlert()
            }

        }
    func EmptyAlert(){
        let alertController=UIAlertController(title: "Alert !!!", message: "Please fill the details ", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController,animated: true,completion: nil)
    }
    func SubmitAlert(){
        let alertController=UIAlertController(title: "Alert !!!", message: "Data Submitted Successfully", preferredStyle: .alert)
        
        let okAction=UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true,completion: nil)
        
        
    }
    func checkValidation()->Bool{
        var checkStatus=false
        
        if !TxtName.text!.isEmpty{
            if !TxtEmail.text!.isEmpty{
                if !TxtPassword.text!.isEmpty{
                    checkStatus=true
                }
            }
        }
        return checkStatus
    }
    
    //encoded the data when the app loads again
    
    func loadUserData(){
        if let savedData=userDefault.data(forKey: "userArray"){
            
            if let decodeUser = try? JSONDecoder().decode([User].self, from: savedData){
                userArray=decodeUser
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        loadUserData()
    }
        
       override func viewDidLoad() {
            super.viewDidLoad()
//            loadUserData()
        }
    }
