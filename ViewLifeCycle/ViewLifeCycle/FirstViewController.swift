import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func submitButton(_ sender: UIButton) {

        sender.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
        
    }
    @objc func gotoNextScreen(){
        
        var nextScreen=SecondViewController()

        var name=textField.text
        nextScreen.enteredName=name
        navigationController?.pushViewController(nextScreen, animated: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        textField.text=""
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        alertControler();
    }
    func alertControler(){
        let alert=UIAlertController(title: "Hello Users", message: "You are on the first Screen ", preferredStyle: .alert)
        let OkAction=UIAlertAction(title: "OK", style: .default)
        alert.addAction(OkAction)
        present(alert, animated: true)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        alertControler()
//    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super .viewDidDisappear(true)
//        alertControler()
//    }
    
}
