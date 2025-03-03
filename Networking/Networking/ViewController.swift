//
//  ViewController.swift
//  Networking
//
//  Created by Eduard Alexis Cardona Grajales on 2/3/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getUserAction(_ sender: Any) {
        
        NetworkingProvider.shared.getUser(id: 123)
        
    }
    
}

