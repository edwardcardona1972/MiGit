//
//  ViewControllerSegundaPantalla.swift
//  FabricaDeAutomoviles
//
//  Created by Eduard Alexis Cardona Grajales on 19/2/25.
//

import UIKit

class ViewControllerSegundaPantalla: UIViewController {
    
       
    @IBOutlet weak var imagenView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var tipoAutomovil:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch tipoAutomovil! {
            case 0:
            print("Voy a crear un objeto automovil sencillo")
            case 1:
            print("Voy a crear un objeto automovil Mazda")
            default:
            print("Error")
            
        }
    }
    
    
    @IBAction func mostrarInformacion(_ sender: Any) {
    }
    
    @IBAction func encender(_ sender: Any) {
    }
    
    @IBAction func apagar(_ sender: Any) {
    }
    
    @IBAction func acelerar(_ sender: Any) {
    }
}
