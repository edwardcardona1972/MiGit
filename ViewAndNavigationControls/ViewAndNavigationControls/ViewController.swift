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
        
        myMap.centerCoordinate = CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332)
        
    }
   
    @IBAction func myButtonAction(_ sender: Any) {
        myFakeView.isHidden = !myFakeView.isHidden
    }
    
}
