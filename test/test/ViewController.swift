import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor=UIColor.white
        
        let myview=UIView(frame: CGRect(x: 50, y: 90, width: 200, height: 100))
        myview.backgroundColor=UIColor.blue
        view.addSubview(myview)
        
        let mynewView=UIView(frame: CGRect(x: 50, y: 90, width: 200, height: 100))
        mynewView.backgroundColor=UIColor.red
        myview.addSubview(mynewView)
myview.transform = CGAffineTransform(rotationAngle:CGFloat.pi/4.0)
//        myview.transform=CGAffineTransform(translationX: 100, y: 20)
        
        let label=UILabel(frame: CGRect(x: 100, y: 450, width: 150, height: 50))
        label.text="Hello I am here "
        label.backgroundColor=UIColor.red
        label.textAlignment = .center
        view.addSubview(label);
        
    }

    
}
