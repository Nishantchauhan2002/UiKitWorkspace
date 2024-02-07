import UIKit


protocol userDeletionDelegate:AnyObject{
    
    func didDeleteUser(at index:Int)
}

let userDefaults=UserDefaults.standard

class SecondScreen: UIViewController {

    var users: [User] = []

    let user1 = User(name: "JohnDoe", email: "john@example.com",password: "1223")
    let user2 = User(name: "Jane", email: "jane@example.com",password:"123")

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if(users.count==0){
            NoUserAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        users.append(user1)
//        users.append(user2)
//
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")

        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SecondScreen: UITableViewDataSource, UITableViewDelegate, userDeletionDelegate {

    func didDeleteUser(at index: Int) {
        users.remove(at: index)
        saveUserToUserDefaults()
        tableView.reloadData()
        
    }
    
    //function to save the updated list to the userdefaults
    
    func saveUserToUserDefaults(){
        if let encodeData=try?JSONEncoder().encode(users){
            userDefaults.setValue(encodeData, forKey: "userArray")
            userDefaults.synchronize()
        }
    }
    func NoUserAlert(){
        let alertController=UIAlertController(title: "Alert !!! ", message: "No user Registered ", preferredStyle: .alert)
        
        let okOption=UIAlertAction(title: "OK", style: .default) { action in
            
           
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okOption)
        
        present(alertController, animated: true,completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = users[indexPath.row]
        
        cell.textLabel?.numberOfLines=0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.textColor = .systemOrange
        
        
        cell.textLabel?.text = "Name: \(user.name), Email: \(user.email), Password: \(user.password)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details=DetailViewController()
        
        
        details.selectedUser=users[indexPath.row]
        details.selectedIndex=indexPath.row
        
        //set the deletion for the second screen itself
        details.deletionDelegate=self
        
        self.navigationController?.pushViewController(details, animated: true)
    }
}

