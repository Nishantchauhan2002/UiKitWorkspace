import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!


    var viewmodel:DetailMovieViewModel

    init(viewmodel:DetailMovieViewModel){
        self.viewmodel=viewmodel

        super.init(nibName: "DetailViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    func configView(){
        self.title="Movie Details"

        titleLabel.text=viewmodel.movieTitle
        descriptionLabel.text=viewmodel.movieDescription
        imageView.sd_setImage(with: viewmodel.movieImage)


    }
}
