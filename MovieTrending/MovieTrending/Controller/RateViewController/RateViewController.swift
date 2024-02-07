import UIKit


class RateViewController: UIViewController {

    
    @IBAction func rateButtonClicked(_ sender: UIButton) {
        let alert=UIAlertController(title: "Thanks !! ", message: "Thanks for rating us ", preferredStyle: .alert)
        let okAction=UIAlertAction(title: "OK", style: .default,handler: {_ in
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
       
    }
}
