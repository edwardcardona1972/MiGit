//
//  AutomovilElectrico.swift
//  FabricaDeAutomoviles
//
//  Created by Eduard Alexis Cardona Grajales on 20/2/25.
//

import Foundation

class AutomovilElectrico: Automovil {
    
    var porcentajeBatería = 100
    
    init(color: String, numeroDeLlantas: Int, precio: Int, porcentajeBatería: Int = 100) {
        self.porcentajeBatería = porcentajeBatería
        super.init(color: color, numeroDeLlantas: numeroDeLlantas, precio: precio, tipoAutomovil: .electrico)
    }
    
    func cargaBatería()-> String {
        porcentajeBatería = 100 
        return "Carga exitosa"
        
    }
}
