import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var txtPassword: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtName: UILabel!
    
    var valName:String!
    var valEmail:String!
    var valPassword:String!
    static let identifier="clCell"
    
    func configure(with user:User){
//        print(user)
        txtName.text="Name - \(user.name)"
        txtEmail.text="Email -\(user.email)"
        txtPassword.text="PassWord -\(user.password)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        txtName.text=valName
        txtEmail.text=valEmail
        txtPassword.text=valPassword
    }
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
