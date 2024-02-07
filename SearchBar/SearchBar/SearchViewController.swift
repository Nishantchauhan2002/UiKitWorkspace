
import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var tableviewcell: UITableViewCell!
    
    var sData=[StudentData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchBar.delegate=self
        myTableView.delegate=self
        myTableView.dataSource=self
        
        myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
        let dh=DatabaseHandler()
        dh.saveData(sName: "Harish")
        dh.saveData(sName: "Mohit Kumar")
        dh.saveData(sName: "Ajay Sharma")
        dh.saveData(sName: "Nishant Chauhan")
        dh.saveData(sName: "Ashish Thakur")
        dh.saveData(sName: "Vishal Rajput")
        dh.saveData(sName: "Tarun Rana")
        dh.saveData(sName: "Mohan Sharma")
        
        sData=dh.fetchData()
        myTableView.reloadData()
        
    
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text=sData[indexPath.row].studentname
        
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let dh=DatabaseHandler()
        
        if searchText != ""{
            sData=dh.fetchSearchedData(sText: searchText)
            myTableView.reloadData()
            
            
        }else{
            sData=dh.fetchData()
            myTableView.reloadData()
        }
    }
    

}
