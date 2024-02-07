

import UIKit


fileprivate let num_of_byte=500000000

class LeakViewController: UIViewController {

    var counter:Int = 0
    var timer:Timer!
    
    var buffer:Array<Int8>=Array(repeating: 0, count: num_of_byte)
    
    @IBAction func startVC(_ sender: Any) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.rootViewController = StartViewController()
                    UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations: nil, completion: nil)
                }
        
    }
    @IBAction func startTimer(_ sender: UIButton) {
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){[weak self] timer in
            guard let self = self else {return }
            self.counter+=1
            print("Counter is \(self.counter)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
