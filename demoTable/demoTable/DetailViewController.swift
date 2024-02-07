import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    var strlbl1:String!
    var strlbl2:String!
    var lblimg:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl1.text=strlbl1
        lbl2.text=strlbl2
        img.image=lblimg
        
    }

}
