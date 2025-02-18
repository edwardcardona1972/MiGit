//
//  ViewController.swift
//  Navegacion
//
//  Created by Eduard Alexis Cardona Grajales on 13/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    var tituloGuardado: String = ""
    var backgroundColorGuardado: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func BotonNegro(_ sender: Any) {
        print("Boton Negro")
        realizarNavegacion(titulo: "Negro", color: .white)
    }
    
    
    @IBAction func BotonRosa(_ sender: Any) {
        print("Boton Rosa")
        realizarNavegacion(titulo: "Rosa", color: .systemPink)
    }
    
    
    @IBAction func BotonVerde(_ sender: Any) {
        print("Boton Verde")
        realizarNavegacion(titulo: "Verde", color: .brown)
    }
    
    
    func realizarNavegacion(titulo: String, color: UIColor){
        print("Boton " + titulo)
        tituloGuardado = titulo
        backgroundColorGuardado = color
        performSegue(withIdentifier: "VCNegro", sender: self)
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: (Any)?){
        
        if segue.identifier == "VCNegro"{
            if let destino = segue.destination as? ViewControllerNegro{
                destino.titulo = tituloGuardado
                destino.backgroundColor = backgroundColorGuardado
            }
        }
    }
}

