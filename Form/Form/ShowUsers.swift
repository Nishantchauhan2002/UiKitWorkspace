import UIKit

class ShowUsers: UIViewController {

    var users:[User]=[]
    
    
    let u1 = User(name: "JohnDoe", email: "john@example.com",password: "1223",dateofJoin: "2jan 2024")
    let u2 = User(name: "Isha", email: "jane@example.com",password:"123",dateofJoin: "3jan 2024")
    let u3 = User(name: "Nishna", email: "john@example.com",password: "1223",dateofJoin: "2jan 2024")
    let u4 = User(name: "Rhit", email: "jane@example.com",password:"123",dateofJoin: "3jan 2024")
    let u5 = User(name: "Mayank", email: "john@example.com",password: "1223",dateofJoin: "2jan 2024")
    let u6 = User(name: "Aryan", email: "jane@example.com",password:"123",dateofJoin: "3jan 2024")
    let u7 = User(name: "Tanu", email: "john@example.com",password: "1223",dateofJoin: "2jan 2024")
    let u8 = User(name: "Rajpal", email: "jane@example.com",password:"123",dateofJoin: "3jan 2024")
    let u9 = User(name: "Nishant", email: "john@example.com",password: "1223",dateofJoin: "2jan 2024")
    let u10 = User(name: "Ram", email: "jane@example.com",password:"123",dateofJoin: "3jan 2024")
    let u11 = User(name: "Vishal", email: "john@example.com",password: "1223",dateofJoin: "2jan 2024")
    let u12 = User(name: "Raviraj", email: "jane@example.com",password:"123",dateofJoin: "3jan 2024")
    


    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users.append(u1)
        users.append(u2)
        users.append(u3)
        users.append(u4)
        users.append(u5)
        users.append(u6)
        users.append(u7)
        users.append(u8)
        users.append(u9)
        users.append(u10)
        users.append(u11)
        users.append(u12)
       
        
        collectionView.dataSource=self
        collectionView.delegate=self
        
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
//        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)

        
        
    }

}
extension ShowUsers:UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let user1=users[indexPath.row]
//        print(user1)
//        cell.valName=user1.name
//        cell.valEmail=user1.email
//        cell.valPassword=user1.password
        cell.configure(with: user1)
        
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        let detail=DetailViewController()
        detail.selectedUser=users[indexPath.row]
        self.navigationController?.present(detail, animated: true)
        
    }
}
