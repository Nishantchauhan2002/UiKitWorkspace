
import UIKit

class MainViewController: UIViewController {

    
    var viewModel:MainViewModel=MainViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var cellDataSource:[MovieTableCellViewModel]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindViewModel()
    }
    
    
    func configureView(){
        self.title="Top Trending Movies"
        view.backgroundColor = .systemBackground
        setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("get data is called")
        viewModel.getData()
    }
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self , let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind {[weak self] movies in
            guard let self = self ,let movies = movies else {
                return
            }
            self.cellDataSource=movies
            self.reloadTableView()
        }
    }

    func openDetail(movieId:Int){
        print("Open Details Called")
        guard let movie=viewModel.retrieveModel(with: movieId)else{
            return
        }
        let detailsMovieViewModel=DetailMovieViewModel(movie: movie)
        let detatilsViewController=DetailViewController(viewmodel: detailsMovieViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detatilsViewController, animated: true)

        }
    }
}
