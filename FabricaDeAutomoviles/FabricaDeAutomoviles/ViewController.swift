//
//  ViewController.swift
//  FabricaDeAutomoviles
//
//  Created by Eduard Alexis Cardona Grajales on 19/2/25.
//

import UIKit

class ViewController: UIViewController {
    
    var tipoAutomovil: TipoDeAutomovil!
    
    var x: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func crearAutomovil(_ sender: Any) {
        tipoAutomovil = TipoDeAutomovil.normal
        performSegue(withIdentifier: "segueSegundaPantalla", sender: self)
    }
    
    @IBAction func crearAutomovilMazda(_ sender: Any) {
        tipoAutomovil = TipoDeAutomovil.electrico
        performSegue(withIdentifier: "segueSegundaPantalla", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerSegundaPantalla {
            destino.tipoAutomovil = self.tipoAutomovil
            destino.estadoAutomovil = true
        }
    }
}

