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
    override func prepare(for segue:UIStoryboardSegue, sender: (Any)?){
        
        if segue.identifier == "VCNegro"{
            
            if let destino = segue.destination as? ViewControllerNegro{
                
                destino.titulo = "Negro"
            }
        }
        if segue.identifier == "VCRosa"{
            
            if let destino = segue.destination as? ViewControllerRosa{
                
                destino.titulo = "Rosa"
                
                
            }
        }
            if segue.identifier == "VCVerde"{
                
                if let destino = segue.destination as? ViewControllerVerde{
                    
                    destino.titulo = "Verde"
                    
                                     
                }
            }
        }
    }

