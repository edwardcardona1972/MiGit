//
//  ViewController.swift
//  Navegacion
//
//  Created by Eduard Alexis Cardona Grajales on 13/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func BotonNegro(_ sender: Any) {
        print("Boton Negro")
        performSegue(withIdentifier: "VCNegro", sender: self)
        
        
    }
    
    
    @IBAction func BotonRosa(_ sender: Any) {
        print("Boton Rosa")
        
        performSegue(withIdentifier: "VCRosa", sender: self)
    }
    
    
    @IBAction func BotonVerde(_ sender: Any) {
        print("Boton Verde")
        performSegue(withIdentifier: "VCVerde", sender: self)
        
    }
    
}
