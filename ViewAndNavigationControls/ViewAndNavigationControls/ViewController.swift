//
//  ViewController.swift
//  ViewAndNavigationControls
//
//  Created by Eduard Alexis Cardona Grajales on 6/2/25.
//

import UIKit
import WebKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myFakeView: UIView!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        
        myMap.centerCoordinate = CLLocationCoordinate2D(latitude: 5.7319444444444, longitude: -75.141944444444)
        
    }
   
    @IBAction func myButtonAction(_ sender: Any) {
        myFakeView.isHidden = !myFakeView.isHidden
    }
    
}
