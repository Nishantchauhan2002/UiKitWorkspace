import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func onButtonClick(_ sender: Any) {
        scrollView.setContentOffset(CGPoint.zero, animated: true)
        
    }
    @IBOutlet weak var lblhead: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        lblhead.text="In a storyboard-based application, you will often want to do a little preparation before navigationIn a storyboard-based application, you will often want to do a little preparation before navigationIn a storyboard-based application, you will often want to do a little preparation before navigationIn a storyboard-based application, you will often want to do a little preparation before navigationIn a storyboard-based application, you will often want to do a little preparation before navigationIn a storyboard-based application, you will often want to do a little preparation before navigationIn a storyboard-based -based application, you will often want to do a little preparation "
       
    }
    
    
}
