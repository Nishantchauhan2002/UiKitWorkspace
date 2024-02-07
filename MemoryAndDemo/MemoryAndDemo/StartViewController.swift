//
//  StartViewController.swift
//  MemoryAndDemo
//
//  Created by Nishant Chauhan on 30/01/24.
//

import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet weak var nextScree: UIButton!
    
    @IBAction func btnClick(_ sender: UIButton) {
        
        if let scenedelegate=UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate{
            scenedelegate.window?.rootViewController=LeakViewController()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        

    }

  
}
