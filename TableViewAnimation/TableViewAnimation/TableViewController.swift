
import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var cellPhotos=["i1","i2","i3","i4","i5","i6","i7","i4","i5","i6","i7"]
    var names=["photo1","photo2","photo3","photo4","photo5","photo6","photo7","photo4","photo5","photo6","photo7"]
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate=self
        myTableView.dataSource=self
        
        myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellPhotos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell=myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        TableViewCell
        
        cell.cellLabel.text=names[indexPath.row]
        cell.cellImage.image=UIImage(named: cellPhotos[indexPath.row])
//        cell.cellImage.layer.cornerRadius=(cell.cellImage.frame.height)/2
        cell.cellImage.layer.cornerRadius=25
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.layer.transform=CATransform3DMakeScale(0.1,0.1, 1.0)
//
//        UIView.animate(withDuration: 1.0, animations:{
//            cell.layer.transform=CATransform3DMakeScale(1.0, 1.0, 1.0)
//        })
//    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha=0
        let transform=CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform=transform
        
        UIView.animate(withDuration: 2.0, animations: {
            cell.alpha=1
            cell.layer.transform=CATransform3DIdentity
        })
    }

}
