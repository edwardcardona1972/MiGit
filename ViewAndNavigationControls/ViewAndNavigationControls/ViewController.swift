//
//  ViewController.swift
//  ViewAndNavigationControls
//
//  Created by Eduard Alexis Cardona Grajales on 6/2/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var myImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func myButtonAction(_ sender: Any) {
        myview.isHidden = true 
    }
    
    
}
