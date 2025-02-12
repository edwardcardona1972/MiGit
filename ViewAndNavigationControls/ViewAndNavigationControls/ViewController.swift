//
//  ViewController.swift
//  ViewAndNavigationControls
//
//  Created by Eduard Alexis Cardona Grajales on 6/2/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myFakeView: UIView!
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
    }
   
    @IBAction func myButtonAction(_ sender: Any) {
        myFakeView.isHidden = !myFakeView.isHidden
    }
    
}
