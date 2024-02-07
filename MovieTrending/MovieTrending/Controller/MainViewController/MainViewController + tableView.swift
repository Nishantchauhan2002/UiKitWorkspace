import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setUpTableView(){
        
        self.tableView.delegate=self
        self.tableView.dataSource=self
        self.tableView.backgroundColor = .clear
        
        self.registerCell()
        
    }
    
//https://api.themoviedb.org/3/trending/movie/day?api_key=6a63135b42a17c53d400db396c27903f
    
    func registerCell(){
        //        print("You are registering the cell in the section")
        
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
        
    }
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("You are in the function of numberofrows")
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell=tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else{
            return UITableViewCell()
        }
//        print("You are in the function of cell")
        let cellViewModel=cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        cell.selectionStyle = .none
        
        cell.rateButtonAction={[weak self] in
            self?.openRate();
            
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId=cellDataSource[indexPath.row].id
        self.openDetail(movieId:movieId)
    }
    
    func openRate(){
        let nextScreen=RateViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    
}
