
import UIKit

class Table: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    var arr1=["Aplha","beta","Gama","Zeta","Nasa"]
    var arr2=["Hello","Users","World","Circle","Earth"]
    var img:[UIImage]=[#imageLiteral(resourceName: "i1"),
                       #imageLiteral(resourceName: "i1"),
                       #imageLiteral(resourceName: "i1"),
                       #imageLiteral(resourceName: "i1"),
                       #imageLiteral(resourceName: "i1"),]
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell=tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as! TableViewCell
        
        cell.lbl1.text=arr1[indexPath.row]
        cell.lbl2.text=arr2[indexPath.row]
        cell.img1.image=img[indexPath.row]
        
//        print(arr1)
//        print(arr2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.view.backgroundColor = .red
        
//        let detail:DetailViewController=self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let detail=DetailViewController()
        detail.lblimg=img[indexPath.row]
        detail.strlbl2=arr2[indexPath.row]
        detail.strlbl1=arr1[indexPath.row]
        print(arr1[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arr1.remove(at: indexPath.row)
            arr2.remove(at: indexPath.row)
            img.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .middle)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tableView.delegate = self
        tableView.dataSource = self
        view.largeContentTitle="TableView Data"
       
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
    }

}
