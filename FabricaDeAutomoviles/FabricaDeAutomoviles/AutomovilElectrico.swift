//
//  AutomovilElectrico.swift
//  FabricaDeAutomoviles
//
//  Created by Eduard Alexis Cardona Grajales on 20/2/25.
//

import Foundation

class AutomovilElectrico: Automovil {
    
    var porcentajeBatería = 100
    func cargaBatería()-> String {
        porcentajeBatería = 100 
        return "Carga exitosa"
        
    }
}
